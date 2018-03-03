# Build your inventory and host_vars and group_vars files for packet.net

```
ansible-playbook -e nuage_release=5.2.2-docker-sdwan-elastic-ip -e lab_domain=nuage521.lab -e lab_network_prefix=192.168.0 -e vsc_ctl_net_prefix=192.168.99 -e util_fqdn=util0105.sdn4docker.com -e aws_access_key=AKIAKAKAKAKAGGHHXA build-packet.yml
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

# Create elastic_ip.yml variables
```
ansible-playbook -e nuage_release=5.2.2-docker-sdwan-elastic-ip -e nuage_core_loc=erw1 -e nuage_core_net=147.75.72.133/29 -e bB_loc=sjc1 -e bA_loc=sjc1 -e bB1_net=147.75.88.18/30 -e bB2_net=147.75.88.116/30  elastic_ip_cfg.yml
```
