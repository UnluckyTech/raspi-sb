#!/bin/bash

echo "Installing heimdall"
cp -rf ~/raspi-sb/Heimdall/ ~/ 
cd ~/heimdall

sudo docker-compose up -d
cd ~/heimdall
if sudo docker ps | grep -q "heimdall"; then
    echo "Heimdall is now installed."
    echo "https://${ip_addr}:8008"
    sleep 1
else
    echo "Heimdall is not running. Please check your installation."
fi