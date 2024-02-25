#!/bin/bash
echo "Installing WatchTower"
cp -rf watchtower/ ~/ 
cd ~/watchtower
sudo docker-compose up -d
if sudo docker ps | grep -q "watchtower"; then
    echo "WatchTower is now installed."
    sleep 1
else
    echo "Portainer is not running. Please check your installation."
fi