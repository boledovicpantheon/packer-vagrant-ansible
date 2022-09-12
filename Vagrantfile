# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://docs.vagrantup.com.

Vagrant.configure("2") do |config|

# Variables
  vagrant_box_dir = "box"

# Global config
  config.vbguest.no_install = false
  config.vbguest.auto_update = false # if true, vagrant fails on `umount /mnt`, need to figure out
  config.vbguest.no_remote = true
  config.vbguest.auto_reboot = true

  config.vm.synced_folder ".", "/vagrant", disabled: false
  
  config.vm.box_check_update = true

# Plugins
  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  end

# VM no.1
  config.vm.define "ubuntu_focal" do |flavor|
    # Path to the `.box` file
    flavor.vm.box = "#{vagrant_box_dir}/packer_ubuntu-server-20.04.box"
    flavor.vm.network "private_network", ip: "192.168.56.10"
    # Port forwarding for SSH, but seems like Vagrant do it automatically
    flavor.vm.network "forwarded_port", id:"ssh", guest: 22, host_ip: "127.0.0.1", host: 65022
    
    # Vbox machine configuration
    flavor.vm.provider "virtualbox" do |vb| 
      vb.name = "ubuntu_focal"
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
      vb.customize ["modifyvm", :id, "--memory", 4096]
      vb.customize ["modifyvm", :id, "--cpus", 4]   
      vb.customize ["modifyvm", :id, "--ostype", "ubuntu_64"]
    end
  end

# VM no.2
  config.vm.define "ubuntu_jammy" do |flavor|
    # Path to the `.box` file
    flavor.vm.box = "#{vagrant_box_dir}/packer_ubuntu-server-22.04.box"
    flavor.vm.network "private_network", ip: "192.168.56.20"
    # Port forwarding for SSH, but seems like Vagrant do it automatically
    flavor.vm.network "forwarded_port", id:"ssh", guest: 22, host_ip: "127.0.0.1", host: 65023
    
    # Vbox machine configuration
    flavor.vm.provider "virtualbox" do |vb| 
      vb.name = "ubuntu_jammy"
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
      vb.customize ["modifyvm", :id, "--memory", 4096]
      vb.customize ["modifyvm", :id, "--cpus", 4]  
      vb.customize ["modifyvm", :id, "--ostype", "ubuntu_64"]  
    end
  end

# Ansible
  config.vm.provision "ansible_local" do |ansible|
    # ansible.provisioning_path = "/vagrant"
    ansible.playbook = "ansible/site.yml"
    ansible.inventory_path = "ansible/inventory/"
    ansible.limit = "all"
    ansible.compatibility_mode = "auto"
    ansible.become = "true" #sudo 
    ansible.verbose = "true" # same as `-v`
  end

# Shutdown
  config.vm.provision "shell",
    inline: "poweroff"

end
