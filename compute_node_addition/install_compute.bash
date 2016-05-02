#!/bin/bash
#
# OpenStack Installer | Compute node addition
# Vinoth Kumar Selvaraj
# E-Mail: vinothkumar6664@me.com
# OpenStack MITAKA for Ubuntu 14.04lts
#
#Compute_node_addition | install_compute

#usage: bash install.bash --controllernode_ip_address 192.168.2.161 --computenode_ip_address 192.168.1.172 --interface_name eth0

# Execute getopt
ARGS=$(getopt -o a:b:c -l "controllernode_ip_address:,computenode_ip_address:,interface_name:" -- "$@");

controller_ip=$2
compute_ip=$4
INTERFACE_NAME=$6

echo $controller_ip  controller >> /etc/hosts
echo $compute_ip  compute >> /etc/hosts
ping controller -c 3
ping compute -c 3


#
#Clone the installer source code
#
apt-get update
apt-get install git -y
#git clone https://github.com/vinothkumarselvaraj/openstack-mitaka.git
git clone https://github.com/CloudenablersPvtLtd/openstack-setup.git -b compute_node_addition

#Use working directory
cd ./openstack-setup/compute_node_addition/

#
#Always backup first
#

cp -r ./mitaka_compute_node_configration ./mitaka_compute_node_configration_bkp
find ./mitaka_compute_node_configration -type f -exec sed -i -e 's/192.168.2.161/'$controller_ip'/g' {} \;
find ./mitaka_compute_node_configration -type f -exec sed -i -e 's/192.168.1.172/'$compute_ip'/g' {} \;
find ./mitaka_compute_node_configration -type f -exec sed -i -e 's/cloudenablers_compute_interface_name/'$INTERFACE_NAME'/g' {} \;

#Start the main installer script
bash main_mitaka_compute_node_addition.bash | tee -a /var/log/my_install_compute_log.log
