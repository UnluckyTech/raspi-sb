#!/bin/bash
echo "Installing Pihole"
cp -rf ~/raspi-sb/pihole/ ~/ 
cd ~/pihole
compose_file=~/pihole/docker-compose.yml
# Create password to access pihole web interface.
read -p "Enter the desired password: " user_password
sed -i "s/WEBPASSWORD: 'set a secure password here or it will be random'/WEBPASSWORD: '$user_password'/" "$compose_file"
echo "Password updated successfully!"
sudo docker-compose up -d
cd ~/raspi-sb
if sudo docker ps | grep -q "pihole"; then
    echo "Pihole is now installed."
    echo "https://${ip_addr}/admin"
    sleep 1
else
    echo "Pihole is not running. Please check your installation."
fi