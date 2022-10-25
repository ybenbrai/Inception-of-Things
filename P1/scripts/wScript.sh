#!/bin/sh

echo "#######   Installing k3s <*>agent<*>    #######"
export INSTALL_K3S_EXEC="agent --server https://192.168.42.110:6443 --token $(sudo cat /shared_folder/token) --node-ip=192.168.42.111"
curl -sfL https://get.k3s.io | sh -