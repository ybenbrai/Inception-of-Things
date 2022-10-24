#!/bin/sh

echo "#######   Create .ssh directory    #######"
mkdir -p /root/.ssh

echo "#######   Copy authorized_keys file    #######"
mv /tmp/id_rsa  /root/.ssh/
mv /tmp/id_rsa.pub  /root/.ssh/

echo "#######   Change permissions    #######"
chmod 400 /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa.pub
chown root:root  /root/.ssh/id_rsa
chown root:root  /root/.ssh/id_rsa.pub

echo "#######   Add key to known_hosts    #######"
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

echo "#######   Change permissions    #######"
chmod 400 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys

echo "#######   Add key to known_hosts    #######"
echo "127.0.0.1 $(hostname)" >> /etc/hosts

echo "#######   Installing k3s    #######"
export INSTALL_K3S_EXEC="server --write-kubeconfig-mode 644 --advertise-address=192.168.42.110 --node-ip=192.168.42.110"
curl -sfL https://get.k3s.io | sh -

echo "#######   Setting up aliases    #######"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
echo "alias c='clear'" >> /home/vagrant/.bashrc
