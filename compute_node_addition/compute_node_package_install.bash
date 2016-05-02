#!/bin/bash
#
# OpenStack Installer | compute node addition
# Vinoth Kumar Selvaraj
# E-Mail: vinothkumar6664@me.com
# OpenStack MITAKA for Ubuntu 14.04lts
#
#
#Compute_node_addition | Package-list

apt-get update
apt-get install chrony -y
apt-get install software-properties-common -y
add-apt-repository cloud-archive:mitaka -y
apt-get update && apt-get dist-upgrade -y
apt-get install python-openstackclient -y

#Install Nova on compute node
apt-get install nova-compute -y

#Install Neutron on compute node
apt-get install neutron-linuxbridge-agent -y
