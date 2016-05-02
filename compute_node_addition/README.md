![alt tag](https://github.com/CloudenablersPvtLtd/openstack-setup/blob/mitaka/openstack-mitaka/mitaka_configration/openstack-mitaka-logo.png)

# OpenStack-mitaka compute_node addition for Ubuntu 14.04LTS
Bash script to install/add compute node to openstack-Mitaka controller in ubuntu 14.04LTS

>Download the script using the below command:
>>git clone https://github.com/CloudenablersPvtLtd/openstack-setup.git

>>cd openstack-setup/compute_node_addition/

Script Usage: install_compute.bash --controllernode_ip_address [Your controller Ip] --computenode_ip_address [Your computenode Ip] --interface_name [interface name of compute node]

Example: bash install_compute.bash --controllernode_ip_address 192.168.2.161 --computenode_ip_address 192.168.1.172 --interface_name eth0

IMPORTANT:
  - Use this script in the fresh ubuntu 14.04LTS machine.
  - Must have static IP configured.
  - This script use same NIC/IP for Management/External/VM Datapath networks.
  - Make sure that the IP you have given must have internet connectivity.
  - The interface name must be the NIC name of above mentioned IP.
  - For your convenient, assign the compute host name as compute1,compute2,compute3 and so on.
  - Reboot the compute node after script installation is completed. 

> Author: Vinoth Kumar Selvaraj

> E-Mail: vinothkumar.s@cloudenablers.com

> website: www.cloudenablers.com

> Date: 02-May-2016
