#!/bin/bash
cp -rf ~/raspi-sb/portainer/ ~/ 
cd ~/portainer
sudo docker-compose up -d
cd ~/raspi-sb
# Check if Portainer container is running
if sudo docker ps | grep -q "portainer"; then
    echo "Portainer is now installed."
    echo "https://${ip_addr}:9443"
else
    echo "Portainer is not running. Please check your installation."
fi
