# Build your inventory and host_vars and group_vars files for packet.net

```
ansible-playbook -e nuage_release=5.2.1-docker-sdwan-elastic-ip-rev2 -e lab_domain=nuage521.lab -e lab_network_prefix=192.168.0 -e util_fqdn=util0105.sdn4docker.com -e aws_access_key=AKIAKAKAKAKAGGHHXA build-packet.yml
ansible-playbook -e nuage_release=5.1.1u1-docker-sdwan -e lab_domain=nuage511u1.lab -e lab_network_prefix=192.168.0 -e aws_access_key=AKIAKAKAKAKAGGHHXA build-packet.yml
```

To destroy everything:
```
ansible-playbook -e nuage_release=5.1.1u1-docker-sdwan -e lab_domain=nuage511u1.lab -e lab_network_prefix=192.168.0 build-packet-reset.yml
```

to manage that onpremises (dont forget change file location before):
```
ansible-playbook -e nuage_release=5.1.1u1-docker-sdwan -e lab_domain=nuage511u1.lab -e lab_network_prefix=192.168.100 -e host_ip=192.168.2.24 onprem-create-inventory.yml
```


# Docker playbook

Edit playbooks and tamplates
```
ansible-playbook -i hosts docker-deploy-consul.yml
ansible-playbook -i hosts docker-deploy-libnetwork-multi.yml
```

