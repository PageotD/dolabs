#!/bin/bash

# Check for private key for vm-vm comm
[ -f /vagrant/id_rsa ] || {
  ssh-keygen -t rsa -f /vagrant/id_rsa -q -N ''
}
# Copy key
[ -f /home/vagrant/.ssh/id_rsa ] || {
    cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
    chmod 0600 /home/vagrant/.ssh/id_rsa
}
# Allow ssh passwordless
grep 'vagrant@' ~/.ssh/authorized_keys &>/dev/null || {
  cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys
  chmod 0600 ~/.ssh/authorized_keys
}
cat > /home/vagrant/.ssh/config <<EOF
Host *
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
EOF

# Add hosts
sudo cp /vagrant/hosts /etc/hosts

# Update repository 
sudo apt-get update

# Symbolic link to the configurations directory
ln -s /vagrant/configurations /home/vagrant/configurations

# Install Ansible and git on lab-control only
unamestr=`uname -n`
echo $unamstr
if [ "$unamestr" == 'control' ]
then
    sudo apt-get install ansible -y
    sudo apt-get install git -y
fi
