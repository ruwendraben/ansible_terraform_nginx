# ansible_terraform_nginx
ansible based terraform IAAS automated repo to easilt run on any environment

# ansible-nginx
# Motive
ansible based ubuntu 20.04 LTS AMI for launch Nginx Server

# Purpose
Excetel practice module

# Problem
Reduce the burden of setting up the IAAS modules faster, accurate using a cook book

# Learn
Ansible, terraform basics and improve AWS managed services knowledge

## How to Use ##
1. git clone git@github.com:ruwendraben/ansible_terraform_nginx.git

2. cd ansible_terraform_nginx/sample-playbooks

3. Ansible steps are contained under roles/web/nginx/tasks/main.yaml (Change as you wish)
(Update and upgrade apt packages -> Install the nginx package -> Copy custom index.html file -> Edit Configuration in Nginx -> start the nginx service)

4. Nginx webcontent are located in roles/web/nginx/files/index.html (Change as you wish)

Note:- 	configure proxy_pass <IP> inside roles/web/nginx/files/index.html
	Listener port (Config in webappserver): edit file /etc/nginx/sites-available/default {Listen port 9001}
	Proxy pass (Config in proxy server): edit file /etc/nginx/sites-available/default where location / { proxy_pass http://172.31.30.62:9001;}
        proxy_pass Server IP should be added to env/hosts file

5. configure host ip file: env/hosts ( example: [webservers]   )
				                             (          172.31.8.209   )

6. Install Ansible and add relevant keys to access AWS account

7. Run ansible
   ansible-playbook -i env/hosts site.yaml
