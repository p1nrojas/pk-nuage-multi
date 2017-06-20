# Build your inventory and host_vars and group_vars files for packet.net

As pretask you should run to hack ansible and use packet.net modules: 
```
source /home/dev/ansible/hacking/env-setup
```
And then
```
ansible-playbook -e nuage_release=40r8 -e lab_domain=sdn40r8.lab -e lab_network_prefix=192.168.0 build-packet.yml
```

To destroy everything:
```
ansible-playbook -e nuage_release=40r8 -e lab_domain=sdn40r8.lab -e lab_network_prefix=192.168.0 build-packet-reset.yml
```
