#!/bin/bash

echo "Installing Fail2Ban"
cp -rf ~/raspi-sb/fail2ban/ ~/ 
cd ~/fail2ban
sed -i "s|- /fail2ban/config:/config|/home/${user}/fail2ban/config:/config|" docker-compose.yml
sed -i "s|- /fail2ban/log:/var/log:ro|/home/${user}/fail2ban/log:/var/log:ro|" docker-compose.yml
sudo docker-compose up -d
cd ~/raspi-sb
if sudo docker ps | grep -q "fail2ban"; then
    echo "Fail2Ban is now installed."
    sleep 1
else
    echo "Fail2Ban is not running. Please check your installation."
fi