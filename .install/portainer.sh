#!/bin/bash
source variable.sh
echo "Installing Portainer"
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
# Check if Portainer container is running
if docker ps | grep -q "portainer"; then
    echo "Portainer is now installed."
    echo "https://${ip_addr}:9443"
    sleep 2
else
    echo "Portainer is not running. Please check your installation."
fi
