#!/bin/bash
#
# OpenStack Installer | compute node addition
# Vinoth Kumar Selvaraj
# E-Mail: vinothkumar6664@me.com
# OpenStack MITAKA for Ubuntu 14.04lts
#
#
#Compute_node_addition | Mitaka_compute_node_terminal_commands

#After  Nova configuration restart the nova service
service nova-compute restart

#Verify the node entry
source admin-openrc
openstack compute service list

#After Neutron configration, restart the neutron service
service neutron-linuxbridge-agent restart

#Verify the neutron service
neutron ext-list
neutron agent-list