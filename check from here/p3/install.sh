#!/bin/bash

### Install kubectl on Ubuntu ###
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

### install K3D ###
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
sudo k3d cluster create my-cluster -p 8080:80@loadbalancer -p 8443:443@loadbalancer -p 8888:8888@loadbalancer --k3s-arg "--disable=traefik@server:0" 

### ArgoCD ###
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

### Wait argocd get deployed ###
sudo kubectl -n argocd rollout status deployment argocd-server

### GET PASSWD ###
#sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

### ADD DEV NAMESPACE ###
#wait till argocd ns is created then use this command
sudo kubectl apply -f install_app.yaml
