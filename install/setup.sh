#!/bin/bash

if [ ! -f /var/log/ansible/ansible-packet-sdnlab.log ]; then
    echo "There is not data. Proceed setup"
    git clone https://github.com/p1nrojas/packet-sdnlab ~/packet-sdnlab
    touch /var/log/ansible/ansible-packet-sdnlab.log
    ssh-keygen -t rsa -b 4096 -C "dev@nuage.io" -f ~/.ssh/id_rsa -q -N ""
    cd /home/dev/packet-sdnlab
    ansible-playbook build.yml
    /bin/bash
else
    echo "Caution: user data detected. skipping setup. Next time override CMD"
    /bin/bash
fi

    
