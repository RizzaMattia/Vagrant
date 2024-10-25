# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  ##Variabili generali
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"


  config.vm.define "web" do |subconfig|
    ##VARIABILI
    VMNAME_WEB = "web.m340"

    ##BOX
    subconfig.vm.box = "ubuntu/jammy64"

    ##RISORSE VM
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = VMNAME_WEB
      vb.memory = "2048"
      vb.cpus = 2
    end

    ##RETE
    subconfig.vm.hostname = VMNAME_WEB
    subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
    subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: "intnet"
  
    ##PROVISION

    #Script per configurazione iniziale
    config.vm.provision "shell", path: "provision-web-conf.sh"
      
    #Mount 
    config.vm.synced_folder "SitoWeb", "/var/www/html"
  end


  config.vm.define "db" do |subconfig|
      ##Variabili
      VMNAME_DB = "db.m340"

      ##BOX
      subconfig.vm.box = "ubuntu/jammy64"

      ##Risorse VM
      subconfig.vm.provider "virtualbox" do |vb|
        vb.name = VMNAME_DB
        vb.memory = "2048"
        vb.cpus = 2
      end

      ##RETE
      subconfig.vm.hostname = VMNAME_DB
      subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: "intnet"
    
      ##PROVISION

      #Script per configurazione iniziale
      config.vm.provision "shell", path: "provision-db-conf.sh"

      #Script per creare il db
      config.vm.provision "shell", path: "provision-mysql-conf.sh"
    end
end
