#!/bin/bash

if [ ! -f /var/log/ansible/ansible-pk-nuage-multi.log ]; then
    echo "There is not data. Proceed setup"
    git clone -b development https://github.com/p1nrojas/pk-nuage-multi ~/pk-nuage-multi
    touch /var/log/ansible/ansible-pk-nuage-multi.log
    ssh-keygen -t rsa -b 4096 -C "dev@nuage.io" -f ~/.ssh/id_rsa -q -N ""
    /bin/bash
else
    echo "Caution: user data detected. skipping setup. Next time override CMD"
    /bin/bash
fi

    
