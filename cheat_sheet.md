# Build your inventory and host_vars and group_vars files for packet.net

As pretask you should run to hack ansible and use packet.net modules: 
```
source /home/dev/ansible/hacking/env-setup
```
And then
```
ansible-playbook -e nuage_release=40r9-core -e lab_domain=sdn40r9.lab -e lab_network_prefix=192.168.0 build-packet.yml
```

To destroy everything:
```
ansible-playbook -e nuage_release=40r9-core -e lab_domain=sdn40r9.lab -e lab_network_prefix=192.168.0 build-packet-reset.yml
```

to manage that onpremises:
```
ansible-playbook -e nuage_release=40r10-k8s-sdwan -e lab_domain=nuage.lab -e lab_network_prefix=172.16.1 -e host_ip=192.168.2.24 onprem-create-inventory.yml
```

Available Configurations
```
# Release 40r8 with Kubernetes*, Docker and Util/NSGs
40r8-k8s-sdwan

# Release 40r8 with Kubernetes*, Docker and Util/NSGs ( VSCs on independent servers for external access)
40r8-k8s-sdwan-ext

# Release 40r9 ( VSD, 1xVSC and ElasticSearch)
40r9-core

# Release 40r9 with Kubernetes*, OpenStack*, Docker and Util/NSGs ( VSCs on independent servers for external access)
40r9-k8s-sdwan-ostack-ext

* requires additional playbook to finish the setup
```


