#!/bin/bash

echo "Installing Unbound"
cp -rf ~/raspi-sb/unbound/ ~/ 
cd ~/unbound

sudo docker-compose up -d
cd ~/unbound
if sudo docker ps | grep -q "unbound"; then
    echo "Unbound is now installed."

else
    echo "Unbound is not running. Please check your installation."
fi