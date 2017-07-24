#!/bin/bash
# Purpose: Run all playbooks at once
# Use with caution!
# Auhor: Mauricio Rojas / pinrojas.com

USER=$(whoami)

display_usage() { 
    echo -e "\nUsage:${0} [cfg-option] \n" 
    } 

# if less than one arguments supplied, display usage 
    if [  $# -le 0 ] 
    then 
        display_usage
        exit 1
    fi 
 
# check whether user had supplied -h or --help . If yes display usage 
    if [[ ( $# == "--help") ||  $# == "-h" ]] 
    then 
        display_usage
        exit 0
    fi 
 
# display usage if the script is not run as dev user 
    if [[ $USER != "dev" ]]; then 
        echo "This script must be run as dev in a container!" 
        exit 1
    fi 

## Here we go!
echo "$(date) Here we go!"

# Uncomment just in case you need to build your host and group vars and YML files
# echo "$(date) Creating inventory, group and host vars and YML files"
# ansible-playbook build.yml

# Activating hacking in ansible
echo "$(date) Activating hacking in ansible"
source /home/dev/ansible/hacking/env-setup

cd /home/dev/pk-sdnlab-stdalone 

# Creating Packet.net device
echo "$(date) Creating packet device for SDWAN"
ansible-playbook -e nuage_release=${1} -e lab_domain=sdn502.lab -e lab_network_prefix=192.168.0 build-packet.yml

echo "$(date) Ready to start installing Nuage"
