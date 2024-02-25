#!/bin/bash
source .install/variable.sh
clear

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

source .install/docker.sh
source .install/portainer.sh

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
