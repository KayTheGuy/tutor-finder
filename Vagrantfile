# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
#  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.synced_folder "./", "/home/vagrant/project"

  cpus = "1"
  memory = "1024" # MB
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", cpus, "--memory", memory]
  end
  config.vm.provider "vmware_fusion" do |v, override|
      v.vmx["memsize"] = memory
      v.vmx["numvcpus"] = cpus
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.add_recipe "baseconfig"
  end

end
