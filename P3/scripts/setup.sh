#/bin/bash
# This script is used to setup the environment for the p3 scripts.

# updating the server
sudo apt-get update -y

# upgrading the packages
sudo apt-get upgrade -y

# preparing to install docker src: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"


# installing docker
sudo apt install docker-ce

# checking status
sudo systemctl status docker

# adding profile to sudoers
sudo usermod -aG docker ${USER}
su - ${USER}

# install kubectl src: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# install k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash

# creating cluster with 3 nodes with loadbalancer
# load balancer is used to access the cluster from outside
sudo k3d cluster create my-cluster --port 8080:80@loadbalancer --port 8888:8888@loadbalancer --port 8443:443@loadbalancer --k3s-arg "--disable=traefik@server:0"

# installing argo CD src: https://argo-cd.readthedocs.io/en/stable/getting_started/
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#Accessing The Argo CD API Server
# argocd is used to deploy the applications
# changing the type to Service Type Load Balancer
sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
# deploying argocd
sudo kubectl -n argocd rollout status deployment argocd-server
# getting the password
# sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


#ressource : https://argo-cd.readthedocs.io/en/stable/user-guide/auto_sync/
# applying the file.yaml
sudo kubectl apply -f deploy.yaml

