#!/bin/bash

echo "Installing homepage"
cp -rf ~/raspi-sb/homepage/ ~/ 
cd ~/homepage

sudo docker-compose up -d
cd ~/raspi-sb
if sudo docker ps | grep -q "homepage"; then
    echo "Homepage is now installed."
    echo "https://${ip_addr}:3000"
    sleep 1
else
    echo "Homepage is not running. Please check your installation."
fi