#!/bin/bash
#
# OpenStack Installer | compute node addition
# Vinoth Kumar Selvaraj
# E-Mail: vinothkumar6664@me.com
# OpenStack MITAKA for Ubuntu 14.04lts
#
#Compute_node_addition | main_mitaka_compute_node_addition


#
#Install the all openstack compute node packages at once!
bash compute_node_package_install.bash

#
#Backup the default files that comes with package installation.
#

#backup default interface files
cp /etc/network/interfaces /etc/network/interfaces_bkp

#backup default nova files
cp /etc/nova/nova.conf /etc/nova/nova.conf-bkp
cp /etc/nova/nova-compute.conf /etc/nova/nova-compute.conf-bkp

#backup default neutron files
cp /etc/neutron/neutron.conf /etc/neutron/neutron.conf-bkp
cp /etc/neutron/plugins/ml2/linuxbridge_agent.ini /etc/neutron/plugins/ml2/linuxbridge_agent.ini-bkp

#
#Copy the pre-configured opensatck configuration file 
#into the appropriate directories 
#

#copy pre-configured nova files
cp ./mitaka_compute_node_configration/nova/nova.conf /etc/nova/nova.conf
cp ./mitaka_compute_node_configration/nova/nova-compute.conf /etc/nova/nova-compute.conf

#copy pre-configured neutron files
cp ./mitaka_compute_node_configration/neutron/neutron.conf /etc/neutron/neutron.conf
cp ./mitaka_compute_node_configration/neutron/plugins/ml2/linuxbridge_agent.ini /etc/neutron/plugins/ml2/linuxbridge_agent.ini

#
#Run the terminal commands 
#
bash mitaka_compute_node_terminal_commands.bash

#
#Restore git clone default IP file in case of re-running
#
mv mitaka_compute_node_configration mitaka_compute_node_configration_executed
cp -r mitaka_compute_node_configration_bkp mitaka_compute_node_configration

#Branding cloudenablers
#echo "Installation successful :-)"
cp welcome /etc/motd
cat cloudenablers-logo


