# DOLABS

DOLABS is a base project to deploy a cluster of virtual machines (VM) using [Hashicorp Vagrant](https://www.vagrantup.com/) and [Oracle Virtualbox](https://www.virtualbox.org/).
The main VM is named *control* and is automatically provisioned with [Ansible]() and [Git](). The other VMs (nodes) can be provisioned from the *control* using Ansible playbooks. 