#!/bin/bash
echo "Installing Docker..."
sudo apt-get update 
sudo apt install -y docker docker-compose curl
# Allow usage of docker without sudo
# sudo usermod -aG docker $USER
# newgrp docker