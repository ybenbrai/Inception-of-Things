#!/usr/bin/sh

echo "127.0.1.1 $(hostname)" >> /etc/hosts

 echo " ============== Installing k3s ============== "
sudo yum -y install vim tree net-tools
sudo yum install -y http://mirror.centos.org/centos/8-stream/AppStream/aarch64/os/Packages/container-selinux-2.164.1-1.module_el8.5.0+870+f792de72.noarch.rpm
export INSTALL_K3S_VERSION=v1.21.4+k3s1
export INSTALL_K3S_EXEC="server --write-kubeconfig-mode 644 --node-ip=192.168.42.110"
sudo curl -sfL https://get.k3s.io |  sh -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
# echo " ============== Installing Nginx.. ============== "

# sudo yum install nginx -y
# sudo systemctl enable nginx
# sudo systemctl start nginx
# sudo firewall-cmd --permanent --add-service=http
# sudo firewall-cmd --reload
# echo " ============== Nginx installed ============== "


echo "Setting up aliases"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc

mv /tmp/*.yml /home/vagrant


echo " ============== deploying part 1 ============== "
# /usr/local/bin/kubectl create configmap app1-html --from-file /home/vagrant/app1/index.html
# /usr/local/bin/kubectl create configmap app2-html --from-file /home/vagrant/app2/index.html
# /usr/local/bin/kubectl create configmap app3-html --from-file /home/vagrant/app3/index.html
echo " ============== lanching first yaml file ============== "
# /usr/local/bin/kubectl apply -f /home/vagrant/deployment.yaml