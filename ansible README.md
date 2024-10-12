first of all setup your master server and node server.
master-server & node-server setup has given in ansible-guide file checkout.
crate any empty folder in your file manager like <demofolder>.
in visual code open that folder.
now you need to clone your repository on visual code.
{command} ctrl+shift+p ----> it will open some options select git clone and select github and your repository.
then again ctrl+shift+p git auto init and then ctrl+shift+p auto git restart.
now you can create your file select create file and create file.
make sure in your visual code <yaml,  auto git,   and  ansible must have> to downloade this go into extension and downlode it.
when will you create ansible playbook that file must have yaml extension like <example.yml>.
after create yaml playbook go into your master server clone there same repository.
run command <git pull origin main>  it will show most updated repository.
to run playbook  = <anisble-playbook path playbook name>.


__________________________________________________________________________________________________________________
# Ansible Setup for Managing Multiple Servers

This guide walks you through the process of setting up **Ansible** to manage configurations on multiple servers using one **master server**.  
You will learn how to automate the installation of NGINX on **node servers** via Ansible from the master server.

---

## 🛠️ **Architecture Overview**

You need **three servers**:
1. **Master Server** – Manages the other two node servers with Ansible.
2. **Node-01** – First target server for automation.
3. **Node-02** – Second target server for automation.

**Benefit of Ansible**:  
- **Configuration management** on multiple servers.
- **Provisioning** (like creating infrastructure such as servers, buckets, etc.).
- **Deployment** automation (CI/CD pipelines).
- **Easy Management** from a central master server.

---

## ⚙️ **Setup Steps**

### **Step 1: Create 3 Servers**
1. **Master server** – Control node.
2. **Node-01** – Target node 1.
3. **Node-02** – Target node 2.

➡️ Use **default security groups** for all servers and **launch the instances**.

---

### **Step 2: SSH into the Master Server**  
On the master server, create a working directory and install Ansible.

```bash
ssh ubuntu@<master-server-ip>
mkdir vikas && cd vikas

```
#!/bin/bash
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible-core -y
```
```
ssh-keygen
cat /home/ubuntu/.ssh/id_rsa.pub
```
```
ssh ubuntu@<node-01-ip>
ssh ubuntu@<node-02-ip>
```

```
cd ~/.ssh
vim authorized_keys
```
```
sudo apt update && sudo apt install python3 -y
```

```
mkdir inventory
vim inventory
```

```
[ubuntuserves]
node-01 ansible_host=<node-01-ip>
node-02 ansible_host=<node-02-ip>
```

```
sudo vim /etc/ansible/hosts
```

```
[ubuntuserves]
node-01 ansible_host=<node-01-ip>
node-02 ansible_host=<node-02-ip>
```

```
ssh ubuntu@<node-01-ip>
ssh ubuntu@<node-02-ip>
```

```
ansible -m ping all
```

```
vim install_nginx.yml
```

```
---
- hosts: ubuntuserves
  become: true
  tasks:
    - name: Install NGINX
      apt:
        name: nginx
        state: present
```

```
ansible-playbook -i inventory install_nginx.yml
```

```
ssh ubuntu@<node-01-ip>
sudo systemctl status nginx
```

```

---

This **interactive README.md** uses:
- **Code blocks** for commands.
- **YAML** syntax for playbooks.
- Clear **step-by-step instructions**.
- **Markdown tables and formatting** to make it easy to read and follow.

You can paste this into your repository's `README.md`, and it will render perfectly on GitHub!
```
cdv
