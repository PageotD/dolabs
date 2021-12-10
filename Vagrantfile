# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
  {
    # Name of the virtual machine
    name: "control",
    # OS used for the virtual machine
    osvm: "debian/bullseye64",
    # Fix IP
    eth1: "192.168.56.110",
    # Specific SSH port
    sshp: 2200,
    # Memory
    mems: 1024,
    # CPU
    cpus: 1,
    # Provisioning type
    type: "shell",
    # Provisioning script
    path: "scripts/deploySSH.sh"
  },
  {
    # Name of the virtual machine
    name: "node-integration",
    # OS used for the virtual machine
    osvm: "debian/bullseye64",
    # Fix IP
    eth1: "192.168.56.111",
    # Specific SSH port
    sshp: 2201,
    # Memory
    mems: 1024,
    # CPU
    cpus: 1,
    # Provisioning type
    type: "shell",
    # Provisioning script
    path: "scripts/deploySSH.sh"
  },
  {
    # Name of the virtual machine
    name: "node-delivery",
    # OS used for the virtual machine
    osvm: "debian/bullseye64",
    # Fix IP
    eth1: "192.168.56.112",
    # Specific SSH port
    sshp: 2202,
    # Memory
    mems: 1024,
    # CPU
    cpus: 1,
    # Provisioning type
    type: "shell",
    # Provisioning script
    path: "scripts/deploySSH.sh"
  }
]

Vagrant.configure("2") do |config|
  boxes.each do |box|
    config.vm.define box[:name] do |subconfig|
      # This configures what box the machine will be brought up against. 
      # The value here should be the name of an installed box or a shorthand
      # name of a box in HashiCorp's Vagrant Cloud.
      subconfig.vm.box = box[:osvm]
      # The hostname the machine should have.
      subconfig.vm.hostname = box[:name]
      # Configures networks on the machine.
      subconfig.vm.network :private_network, ip: box[:eth1]
      subconfig.vm.network "forwarded_port", guest: 22, host: box[:sshp], id: "ssh"

      # Configures provider-specific configuration, which is used to modify
      # settings which are specific to a certain provider.
      subconfig.vm.provider :virtualbox do |vb|
        # Add the virtualbox to the dolabs group
        vb.customize ["modifyvm", :id, "--groups", "/dolabs"]
        # The name the virtualbox should have
        vb.name = "lab-"+box[:name]
        # Configure the allocated RAM
        vb.memory = box[:mems]
        # Configure the allocated CPU
        vb.cpus = box[:cpus]
      
      # Configures provisioners on the machine, so that software can be 
      # automatically installed and configured when the machine is created.
      subconfig.vm.provision box[:type], privileged: false, path: box[:path]
      
      end
    end
  end
end
