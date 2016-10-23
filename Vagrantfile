$script = <<SCRIPT
yum install -y mariadb mariadb-server docker
systemctl start mariadb
systemctl start docker
systemctl enable mariadb
mysql -u root -h localhost -e "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;"
cd /vagrant
docker build -t frevocrm .
SCRIPT

# -*- coding: utf-8 -*-
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.provision "shell", inline: $script
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2", "--ioapic", "on"]
  end
  config.vm.define :frevocrm do |f|
    f.vm.network :private_network, ip: "192.168.56.201"
  end
end

