# DOLABS

DOLABS is a base project to deploy a cluster of virtual machines (VM) using [Hashicorp Vagrant](https://www.vagrantup.com/) and [Oracle Virtualbox](https://www.virtualbox.org/).
The main VM is named *control* and is automatically provisioned with [Ansible](https://www.ansible.com/) and [Git](https://git-scm.com/). The other VMs (nodes) can be provisioned from the *control* using Ansible playbooks.

## Prerequisites

Obviously, you need to have [Hashicorp Vagrant](https://www.vagrantup.com/) and [Oracle Virtualbox](https://www.virtualbox.org/) installed on your machine.

Once you have [Hashicorp Vagrant](https://www.vagrantup.com/) installed, you need to download a Vagrant box from the (Vagrant Cloud)[https://app.vagrantup.com/boxes/search] (in my case Debian Bullseye):

```shell
vagrant box add debian/bullseye64
```

## Deploy VMs

To deploy the VMs, you just have to run the Vagrantfile from the folder where it lies:

```shell
vagrant up
```

## Connect to VM control

```shell
vagrant ssh control
```

## Install Prometheus server on control
```shell
ansible-playbook -i configurations/hosts configurations/prometheus/playbook_prometheus_server.yml
```

## Install Prometheus exporter on nodes
```shell
ansible-playbook -i configurations/hosts configurations/prometheus/playbook_pro
metheus_exporter.yml
```


