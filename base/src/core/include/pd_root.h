/*
 * \brief  PD root interface
 * \author Christian Helmuth
 * \date   2006-07-17
 */

/*
 * Copyright (C) 2006-2011 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _CORE__INCLUDE__PD_ROOT_H_
#define _CORE__INCLUDE__PD_ROOT_H_

/* Genode */
#include <root/component.h>

/* Core */
#include <pd_session_component.h>

namespace Genode {

	class Pd_root : public Root_component<Pd_session_component>
	{
		private:

			Rpc_entrypoint *_thread_ep;

		protected:

			Pd_session_component *_create_session(const char *args) {
				return new (md_alloc()) Pd_session_component(_thread_ep, args); }

		public:

			/**
			 * Constructor
			 *
			 * \param session_ep  entry point for managing pd session objects
			 * \param thread_ep   entry point for managing threads
			 * \param md_alloc    meta-data allocator to be used by root component
			 */
			Pd_root(Rpc_entrypoint *session_ep,
			        Rpc_entrypoint *thread_ep,
			        Allocator      *md_alloc)
			:
				Root_component<Pd_session_component>(session_ep, md_alloc),
				_thread_ep(thread_ep) { }
	};
}

#endif /* _CORE__INCLUDE__PD_ROOT_H_ */
