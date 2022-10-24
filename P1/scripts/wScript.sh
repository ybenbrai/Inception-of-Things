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

# Add kubemaster1 in  /etc/hosts
echo "#######   Adding The Master key to known_hosts    #######"
echo "192.168.42.110  ybenbraiS" >> /etc/hosts

echo "#######   Installing k3s <*>agent<*>    #######"
scp -o StrictHostKeyChecking=no root@ybenbrais:/var/lib/rancher/k3s/server/token /tmp/token
export INSTALL_K3S_EXEC="agent --server https://ybenbraiS:6443 --token-file /tmp/token --node-ip=192.168.42.111"
curl -sfL https://get.k3s.io | sh -

echo "#######   Setting up aliases"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc
echo "alias c='clear'" >> /home/vagrant/.bashrc