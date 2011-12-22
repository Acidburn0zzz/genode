/*
 * \brief  Dummy definitions for native types used for compiling unit tests
 * \author Norman Feske
 * \date   2009-10-02
 */

/*
 * Copyright (C) 2009-2011 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _INCLUDE__BASE__NATIVE_TYPES_H_
#define _INCLUDE__BASE__NATIVE_TYPES_H_

namespace Genode {

	typedef volatile int  Native_lock;
	typedef int           Native_thread;
	typedef Native_thread Native_thread_id;
	typedef struct { }    Native_utcb;

	class Native_capability
	{
		private:

			long _local_name;

		public:

			Native_capability() : _local_name(0) { }
			Native_capability(Native_thread_id, long local_name)
			: _local_name(local_name) { }

			bool             valid()      const { return _local_name != 0; }
			int              local_name() const { return _local_name; }
			int              dst()        const { return 0; }
			Native_thread_id tid()        const { return 0; }
	};

	typedef int Native_connection_state;
}

#endif /* _INCLUDE__BASE__NATIVE_TYPES_H_ */
