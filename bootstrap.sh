#!/bin/bash

environment=$2
component=$1
#!/bin/bash

# Install Ansible and Python dependencies
dnf install -y ansible python3-pip
pip3 install --upgrade pip
pip3 install boto3 botocore


REPO_URL=https://github.com/praveenapalla4-creator/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf


mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
touch ansible.log


cd $REPO_DIR
#chekc if anisible repo is already closed or not

if [ -d $ANSIBLE_DIR ]; then
  
  cd $ANSIBLE_DIR
  git pull
else 
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi
echo "environmnet is :$2"
ansible-playbook -e component=$component  -e env=$environment main.yaml