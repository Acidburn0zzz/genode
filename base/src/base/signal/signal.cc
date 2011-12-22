/*
 * \brief  Generic implementation parts of the signaling framework
 * \author Norman Feske
 * \date   2008-09-16
 */

/*
 * Copyright (C) 2008-2011 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#include <base/signal.h>
#include <base/thread.h>
#include <signal_session/connection.h>

using namespace Genode;


/**
 * Return process-wide signal session used for signal allocation and submission
 */
static Signal_connection *signal_connection()
{
	static Signal_connection sc;
	return &sc;
}


/******************************************************
 ** Process-wide connection to core's signal service **
 ******************************************************/

enum { STACK_SIZE = 4096 };

class Signal_handler_thread : Thread<STACK_SIZE>, Lock
{
	private:

		/**
		 * Return process-wide signal source used for signal reception
		 *
		 * This function must be called from the context of the signal handler
		 * thread because on some platforms (e.g., Fiasco.OC), the calling
		 * thread context is used for implementing the signal-source protocol.
		 */
		static Signal_source *signal_source();

		void entry()
		{
			Signal_source *source = signal_source();
			unlock();
			Signal_receiver::dispatch_signals(source);
		}

	public:

		/**
		 * Constructor
		 */
		Signal_handler_thread()
		: Thread<STACK_SIZE>("signal handler"), Lock(Lock::LOCKED)
		{
			start();

			/*
			 * Make sure to have initialized the 'signal_source()' channel
			 * before proceeding with the use of signals. Otherwise, signals
			 * that occurred until the construction of 'signal_source' is
			 * completed may get lost.
			 */
			lock();
		}
};


Signal_source *Signal_handler_thread::signal_source()
{
	static Signal_source_client sigsrc(signal_connection()->signal_source());
	return &sigsrc;
}


/**
 * Return process-wide signal source used for signal reception
 */
static Signal_handler_thread *signal_handler_thread()
{
	static Signal_handler_thread signal_handler_thread;
	return &signal_handler_thread;
}



/************************
 ** Signal transmitter **
 ************************/

Signal_transmitter::Signal_transmitter(Signal_context_capability context)
: _context(context) { }


void Signal_transmitter::context(Signal_context_capability context)
{
	_context = context;
}


void Signal_transmitter::submit(int cnt)
{
	signal_connection()->submit(_context, cnt);
}


/*********************
 ** Signal receiver **
 *********************/

void Signal_receiver::_unsynchronized_dissolve(Signal_context *context)
{
	/* tell core to stop sending signals referring to the context */
	signal_connection()->free_context(context->_cap);

	/* restore default initialization of signal context */
	context->_receiver             = 0;
	context->_list_element.context = 0;
	context->_cap                  = Signal_context_capability();

	/* remove context from context list */
	_contexts.remove(&context->_list_element);
}


Signal_receiver::Signal_receiver()
{
	/* make sure that the process-local signal handler thread is running */
	signal_handler_thread();
}


Signal_receiver::~Signal_receiver()
{
	Lock::Guard list_lock_guard(_contexts_lock);

	/* disassociate contexts from the receiver */
	for (Signal_context::List_element *le; (le = _contexts.first()); )
		_unsynchronized_dissolve(le->context);
}


Signal_context_capability Signal_receiver::manage(Signal_context *context)
{
	if (context->_receiver)
		throw Context_already_in_use();

	context->_receiver = this;
	context->_list_element.context = context;

	Lock::Guard list_lock_guard(_contexts_lock);

	/* insert context into context list */
	_contexts.insert(&context->_list_element);

	bool try_again;
	do {
		try_again = false;
		try {

			/* use signal context as imprint */
			context->_cap = signal_connection()->alloc_context((long)context);
			return context->_cap;

		} catch (Signal_session::Out_of_metadata) {

			/* give up if the error occurred a second time */
			if (try_again)
				break;

			PINF("upgrade quota donation for SIGNAL session");
			env()->parent()->upgrade(signal_connection()->cap(), "ram_quota=4K");
			try_again = true;
		}
	} while (try_again);
	return Signal_context_capability();
}


void Signal_receiver::dissolve(Signal_context *context)
{
	if (context->_receiver != this)
		throw Context_not_associated();

	Lock::Guard list_lock_guard(_contexts_lock);

	_unsynchronized_dissolve(context);
}


bool Signal_receiver::pending()
{
	Lock::Guard list_lock_guard(_contexts_lock);

	/* look up the contexts for the pending signal */
	for (Signal_context::List_element *le = _contexts.first(); le; le = le->next()) {

		Signal_context *context = le->context;

		Lock::Guard lock_guard(context->_lock);

		if (context->_pending)
			return true;
	}
	return false;
}


Signal Signal_receiver::wait_for_signal()
{
	for (;;) {

		/* block until the receiver has received a signal */
		_signal_available.down();

		Lock::Guard list_lock_guard(_contexts_lock);

		/* look up the contexts for the pending signal */
		for (Signal_context::List_element *le = _contexts.first(); le; le = le->next()) {

			Signal_context *context = le->context;

			Lock::Guard lock_guard(context->_lock);

			/* check if context has a pending signal */
			if (!context->_pending)
				continue;

			context->_pending = false;
			Signal result = context->_curr_signal;

			/* invalidate current signal in context */
			context->_curr_signal = Signal(0, 0);

			/* return last received signal */
			return result;
		}

		/*
		 * Normally, we should never arrive at this point because that would
		 * mean, the '_signal_available' semaphore was increased without
		 * registering the signal in any context associated to the receiver.
		 */
		class Wait_for_signal_unexpected_error { };
		throw Wait_for_signal_unexpected_error();
	}
	return Signal(0, 0); /* unreachable */
}


void Signal_receiver::local_submit(Signal ns)
{
	Signal_context *context = ns.context();

	if (!context) return;

	Lock::Guard lock_guard(context->_lock);

	/*
	 * Replace current signal of the context by signal with accumulated
	 * counters. In the common case, the current signal is an invalid
	 * signal with a counter value of zero.
	 */
	int num = context->_curr_signal.num() + ns.num();
	context->_curr_signal = Signal(context, num);

	/* wake up the receiver if the context becomes pending */
	if (!context->_pending) {
		context->_pending = true;
		_signal_available.up();
	}
}


void Signal_receiver::dispatch_signals(Signal_source *signal_source)
{
	for (;;) {
		Signal_source::Signal source_signal = signal_source->wait_for_signal();

		/* look up context as pointed to by the signal imprint */
		Signal_context *context = (Signal_context *)(source_signal.imprint());

		/* sanity check */
		if (!context) continue;

		/* construct and locally submit signal object */
		Signal signal(context, source_signal.num());
		context->_receiver->local_submit(signal);
	}
}
