#!/bin/bash

if [ ! -f /var/log/ansible/ansible-pk-sdnlab-stdalone.log ]; then
    echo "There is not data. Proceed setup"
    git clone https://github.com/p1nrojas/pk-sdnlab-stdalone ~/pk-sdnlab-stdalone
    touch /var/log/ansible/ansible-pk-sdnlab-stdalone.log
    ssh-keygen -t rsa -b 4096 -C "dev@nuage.io" -f ~/.ssh/id_rsa -q -N ""
    cd /home/dev/pk-sdnlab-stdalone
    ansible-playbook build.yml
    /bin/bash
else
    echo "Caution: user data detected. skipping setup. Next time override CMD"
    /bin/bash
fi

    
