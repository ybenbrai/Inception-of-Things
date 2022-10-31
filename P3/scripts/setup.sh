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
sudo apt install docker-ce -y

# checking status
sudo systemctl status docker



