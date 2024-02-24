#!/bin/bash
ip_addr=$(ip a show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "%%%%%                                                                    %%%%%"
echo "%%%%%                  Beginning Installation of RasPi-SB                %%%%%"
echo "%%%%%                       Report any issues here...                    %%%%%"
echo "%%%%%             https://github.com/UnluckyTech/raspi-sb/issues         %%%%%"
echo "%%%%%                                                                    %%%%%"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ''
echo "Installing Docker..."
sudo apt-get update 
sudo apt install -y docker docker-compose curl

# Allow usage of docker without sudo
sudo usermod -aG docker $USER
newgrp docker

echo "Installing Portainer"
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

echo "Portainer Installed"
echo "https://${ip_addr}:9443"

echo "Installing Pihole"
cp -rf pihole/ ~/ 
cd ~/pihole
compose_file=~/pihole/docker-compose.yml
# Create password to access pihole web interface.
read -p "Enter the desired password: " user_password
sed -i "s/WEBPASSWORD: 'set a secure password here or it will be random'/WEBPASSWORD: '$user_password'/" "$compose_file"
echo "Password updated successfully!"
docker-compose up -d

echo "Installing WatchTower"
cd ~/raspi-sb/watchtower
docker-compose up -d

echo "Installing Wireguard"
curl -L https://install.pivpn.io | bash
