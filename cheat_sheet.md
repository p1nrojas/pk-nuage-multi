# Build your inventory and host_vars and group_vars files for packet.net

```
ansible-playbook -e nuage_release=5.1.1u1-docker-sdwan -e lab_domain=nuage511u1.lab -e lab_network_prefix=192.168.0 -e aws_access_key=AKIAKAKAKAKAGGHHXA build-packet.yml
```

To destroy everything:
```
ansible-playbook -e nuage_release=40r9-core -e lab_domain=sdn40r9.lab -e lab_network_prefix=192.168.0 build-packet-reset.yml
```

to manage that onpremises (dont forget change file location before):
```
ansible-playbook -e nuage_release=5.1.1u1-docker-sdwan -e lab_domain=nuage511u1.lab -e lab_network_prefix=192.168.99 -e host_ip=192.168.2.24 onprem-create-inventory.yml
```

