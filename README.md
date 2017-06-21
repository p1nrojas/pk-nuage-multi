## Caution! Use it under your own risk. Intended for PoCs and Lab

# Createyour SDN experience (WAN and DC end-to-end programability on VXLANs) at packet.net (Nuage Virtualized Network Services)

This playbook will create a Bare Metal Type 2 server at packet.net and install a whole Nuage VNS solution to try things like Zero Touch Bootstrapping and  Application Aware Routing. Also, you can play segmenting traffic and using ACLs between WAN Branches and Containers on Kubernetes

Installing gateways, dns and ntp services, management and control planes in just one server with Centos7 KVM. Then what we do with this playbook is:
- Install your KVM server (named core or whatever you like) into the brand new bare metal type 2 server.
- Create a dns/ntp/dhcp instance.
- Nuage VSD ( management ) and a couple of VCSs (control).
- Util server to bootstrap your NSGs
- Stat to collect stats and apply Intelligence (Elastic Search)
- Two NSG-vs as head ends at the Datacenter
- Four NSG-vs as remote sites and a couple of clients behind
- Clients are using Ubuntu Desktop
- WebVirtMgr to manage your instances and bootstrapping process

More details at pinrojas.com (http://wp.me/p44sHI-1iO) and Check the app at https://github.com/p1nrojas/pk-sdnlab-stdalone. Check youtube at https://www.youtube.com/watch?v=ydQmYJQnkuo. More details about AAR at https://www.youtube.com/watch?v=bBdHYoLJ6Tk. And about Zero touch Bootstrapping (ZTP) at https://www.youtube.com/watch?v=nZUY4nq0Mmc

## Prepare your enviroment

Install docker on your laptop or any Linux server with access to Internet. You must have your Token ID, Project ID and Nuage License key at your reach.

## How to start

Create a folder in your latop/server and run the following.

```
curl -fsSL https://https://git.io/vQkzV > download.sh; chmod 755 download.sh; ./download.sh
```
This script will download some files to create your docker image.

```
docker build -t p1nrojas/pk-sdnlab-stdalone
``` 

Let's start with the data-only-container and then with the app one.

```
docker run -d --name pk-data-only p1nrojas/pk-sdnlab-stdalone true
docker run -d -i -t --volumes-from pk-data-only --name pk-ansible  p1nrojas/pk-sdnlab-stdalone
```

Get access to a container
```
docker exec -i -t pk-ansible /bin/bash
```

Get access to the project at ~/pk-sdnlab-stdalone and check your cfg folder with the settings of your lab. You don't need to modify anything.
Then, run the following to build your lab inventory and host_vars files, and create the packet server on the project you have chosen.

```
pk-create.sh 40r8
```

And finally, run the playbook (take about 60min)
```
ansible-playbook -i hosts deploy-all.yml
```

When you're done. Just add the KVM server to you WebVirtMgr and play. Let's figure your 'core' server is using 147.88.157.133 as Public IP address. Then you have to do the follwoing to start playing. 
- Create libvirt user: saslpasswd2 -a libvirt virtmgr (use the password you want)
- Connect WebVirtMgr at: http://147.88.157.133:8090
- Use credentials (webvirtmgr): admin/webvirtmgr (don't forget to change password later)
- Connect VSD at: https://147.88.157.133:8443
- Clients (Ubuntu Desktop) use nuage/nuage credentials 

You can add vsd1.sdn40r8.lab and stat.sdn40r8.lab to your /etc/hosts
To access stats from VSD you will need to accept self-signed certificate at https://stat.sdn40r8.lab:6200


## Create your organization, NSG profiles....
There is an 'extras' folder inside pk-sdnlab-stdalone folder (playbook directory) that you can use to set up your test domains:
```
cd extras
python vsd_script.py
```

## Some playbook can be used to reset some part of the setup

```
# destroy your ovs  bridges
ansible-playbook -i hosts ovs-reset.yml
# destroy all your KVM domains
ansible-playbook -i hosts reset-all-domains.yml
```
## Set your Kubernetes cluster

Use the inventory in 'extras' folder: 'k8s-hosts-inventory' 
And execute playbook on other folder from 'https://github.com/p1nrojas/ansible-kubeadm-nuage'

## Last comments

Check on the cheat_sheet.md at every folder

See ya!
