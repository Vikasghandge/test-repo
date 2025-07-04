### install docker using playbook.
vi install_docker.yml

```
---
# docker_install.yml - Simple Docker Engine installation for Ubuntu 24.04
- name: Install Docker Engine on Ubuntu 24.04
  hosts: all
  become: true
  vars:
    # CHANGE THIS to your actual username
    docker_user: "ubuntu"
  
  tasks:
    - name: Update apt package cache
      apt:
        update_cache: yes
        cache_valid_time: 3600
    
    - name: Install prerequisites
      apt:
        name:
          - apt-transport-https
          - ca-certificates
          - curl
          - gnupg
          - lsb-release
        state: present
    
    - name: Clean up any old Docker installations
      apt:
        name:
          - docker
          - docker-engine
          - docker.io
          - containerd
          - runc
        state: absent
    
    - name: Create keyrings directory
      file:
        path: /etc/apt/keyrings
        state: directory
        mode: '0755'
    
    - name: Remove any existing Docker GPG keys
      file:
        path: "{{ item }}"
        state: absent
      loop:
        - /etc/apt/keyrings/docker.gpg
        - /etc/apt/keyrings/docker.asc
    
    - name: Add Docker's official GPG key
      shell: |
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg
      args:
        creates: /etc/apt/keyrings/docker.gpg
    
    - name: Set up Docker repository
      shell: |
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      args:
        creates: /etc/apt/sources.list.d/docker.list
    
    - name: Update apt package cache with Docker repository
      apt:
        update_cache: yes
    
    - name: Install Docker Engine
      apt:
        name:
          - docker-ce
          - docker-ce-cli
          - containerd.io
        state: present
    
    - name: Check if user exists
      command: id {{ docker_user }}
      register: user_exists
      ignore_errors: yes
      changed_when: false
    
    - name: Add user to docker group
      user:
        name: "{{ docker_user }}"
        groups: docker
        append: yes
      when: user_exists is succeeded
    
    - name: Enable and start Docker service
      systemd:
        name: docker
        state: started
        enabled: yes
    
    - name: Verify Docker installation
      command: docker --version
      register: docker_version
      changed_when: false
    
    - name: Display Docker version
      debug:
        var: docker_version.stdout
    
    - name: Run test container
      command: docker run --rm hello-world
      register: hello_world_output
      changed_when: false
    
    - name: Display hello-world output
      debug:
        msg: "Docker installation successful! Hello World container ran successfully."
```
