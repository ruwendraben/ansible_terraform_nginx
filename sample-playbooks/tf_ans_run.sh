#!/bin/bash

cd ~/ansible-nginx/ansible-nginx/sample-playbooks
terraform init
terraform fmt
terraform plan
terraform apply

echo "[webservers]" > env/hosts
cat terraform.tfstate | grep '"private_ip":' | cut -d '"' -f 4 >> env/hosts

ansible-playbook -i env/hosts site.yaml --check
ansible-playbook -i env/hosts site.yaml
