# Build your inventory and host_vars and group_vars files for packet.net

```
ansible-playbook -e nuage_release=40r8 -e lab_domain=sdn40r8.lab -e lab_network_prefix=192.168.0 build-packet.yml
```
