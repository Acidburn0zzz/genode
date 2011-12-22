/*
 * \brief  Address-node holds a client-specific session-component.
 * \author Stefan Kalkowski
 * \date   2010-08-25
 */

/*
 * Copyright (C) 2010-2011 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _ADDRESS_NODE_H_
#define _ADDRESS_NODE_H_

/* Genode */
#include <util/avl_tree.h>
#include <util/list.h>
#include <nic_session/nic_session.h>
#include <net/netaddress.h>
#include <net/ethernet.h>
#include <net/ipv4.h>

namespace Net {

	/* Forward declaration */
	class Session_component;


	/**
	 * An Address_node encapsulates a session-component and can be hold in
	 * a list and/or avl-tree, whereby the network-address (MAC or IP)
	 * acts as a key.
	 */
	template <unsigned LEN>
	class Address_node : public Genode::Avl_node<Address_node<LEN> >,
	                     public Genode::List<Address_node<LEN> >::Element
	{
		public:

			typedef Network_address<LEN> Address;

		private:

			Address            _addr;       /* MAC or IP address  */
			Session_component *_component;  /* client's component */

		public:

			/**
			 * Constructor
			 *
			 * \param addr  Network address acting as sorting criteria.
			 * \param component  pointer to client's session component.
			 */
			Address_node(Address addr, Session_component *component)
			: _addr(addr), _component(component) { }


			/***************
			 ** Accessors **
			 ***************/

			Address            addr()      { return _addr;      }
			Session_component *component() { return _component; }

			/**
			 * Let this client node, receive a network-packet
			 *
			 * \param addr  start address of network packet
			 * \param size  size of network packet
			 */
			void receive_packet(void *addr, Genode::size_t size);


			/************************
			 ** Avl node interface **
			 ************************/

			bool higher(Address_node *c)
			{
				using namespace Genode;

				return (memcmp(&c->_addr.addr, &_addr.addr,
				               sizeof(_addr.addr)) > 0);
			}

			/**
			 * Find by address
			 */
			Address_node *find_by_address(Address addr)
			{
				using namespace Genode;

				if (addr == _addr)
					return this;

				bool side = memcmp(&addr.addr, _addr.addr,
				                   sizeof(_addr.addr)) > 0;
				Address_node *c = Avl_node<Address_node>::child(side);
				return c ? c->find_by_address(addr) : 0;
			}
	};


	typedef Address_node<Ipv4_packet::ADDR_LEN>    Ipv4_address_node;
	typedef Address_node<Ethernet_frame::ADDR_LEN> Mac_address_node;
}

#endif /* _ADDRESS_NODE_H_ */
