# set up the default terminal
ENV["TERM"]="linux"

Vagrant.configure("2") do |config|

  # set the image for the vagrant box
  config.vm.box = "opensuse/Leap-15.2.x86_64"
# 15.2.31.632
  # st the static IP for the vagrant box
  config.vm.network "private_network", ip: "192.168.56.4"

  # consifure the parameters for VirtualBox provider
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  config.vm.provision "shell", inline: <<-SHELL
    # install a k3s cluster
    curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.23.1+k3s2 K3S_KUBECONFIG_MODE="644" sh -
    # install Helm
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
  SHELL
  # allow ample time for vagrant up
  config.vm.boot_timeout = 600
end
