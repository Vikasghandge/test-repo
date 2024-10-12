first of all we have to create 3 server you can create according to you.

first server should be one main master server and another two node servers

the benefit of ansible we can manage configration on multiple servers through one master server.
like congfiguration, provisioning[like creating infa for applications like sevrer, bucckets etc], depolying {cicd}
and ansible is configration management automantion tool.

Steps - create three servers ex.  1] master-server 2] node-01 3] node-03

you can take default security groups for all then launch serves.
step-02

take ssh of master server.

then create on folder/directory ex. vikas

then cd vikas.

now in vikas you need to install ansible and require packages.
!#bin/bash
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt update -y
# sudo apt install ansible -y 
sudo apt install ansible-core

step-03
you need to create one ssh key for node servers.
commnd to generate ssh key [ssh-keygen] path of your ssh key cat /home/ubuntu/.ssh/id_rsa.pub
then copy this key.

now we ned to take ssh of node serves take ssh of both servers node-01 and node-02.
then cd .ssh then vim authorized_keys, after that past your public key their of your master server in authorized_keys.

make sure there python should be intalled in node-01 and node-02.

copy public ip of node-01  and node-02.

now again take ssh of master server.

then in pwd mkdir inventory. then paste your node serves ip in inventory.
like in this formate
```
[ubuntuserves]
node-01 ansible_host=<public_ip of your node-01>
node-02 ansible_host=<public_ip of your node-02>
```
do one thing sudo vim  /etc/ansible/hosts
paste there same formate into sudo vim /etc/ansible/hosts

```
[ubuntuserves]
node-01 ansible_host=<public_ip of your node-01>
node-02 ansible_host=<public_ip of your node-02>
```
now ssh <ip_node-server> cross verify both ips

then run command ansible -m ping all make sure your connection between master and node has created.

now you need to create one play book where are going to install nginx on our servers throug master server.

for ex.  vim install_nginx.sh it will open vim editor then you can create here your yaml play-book.

other you can past script here.  save this file [esc :wq] it will save the file.

run command ansible-playbook -i inventory [path of your inventory] and playbook name install_nginx.sh
now you have sucessfully installed nginx on your node servers.

go and check through ssh.


