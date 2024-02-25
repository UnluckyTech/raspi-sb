#!/bin/bash
echo "Installing WatchTower"
cd ~/raspi-sb/watchtower
docker-compose up -d
if docker ps | grep -q "watchtower"; then
    echo "WatchTower is now installed."
    sleep 1
else
    echo "Portainer is not running. Please check your installation."
fi