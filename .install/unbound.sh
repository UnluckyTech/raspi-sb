#!/bin/bash

echo "Installing Unbound"
cp -rf ~/raspi-sb/unbound/ ~/ 
cd ~/unbound

retry_count=0
max_retries=3

while [ $retry_count -lt $max_retries ]; do
    sudo docker-compose up -d
if [ $? -eq 0 ]; then
        # No error, break out of the loop
        break
    else
        # Error encountered, increment retry count
        ((retry_count++))
        echo "Retrying docker-compose up (Attempt $retry_count/$max_retries)..."
    fi
done

cd ~/raspi-sb
if sudo docker ps | grep -q "unbound"; then
    echo "Unbound is now installed."

else
    echo "Unbound is not running. Please check your installation."
fi