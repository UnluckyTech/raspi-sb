#!/bin/bash

echo "Installing Tailscale"

curl -fsSL https://tailscale.com/install.sh | sh
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
# insert this at the end of the script when everything is finished.
# sudo tailscale up --advertise-exit-node

# cp -rf ~/raspi-sb/tailscale/ ~/
# cd ~/tailscale 

# Set the path to the docker-compose.yaml file
# compose_file="~/tailscale/docker-compose.yaml"

# read -p "Enter the TS_AUTHKEY: " ts_authkey

# Update the docker-compose.yaml file
# sed -i "s/TS_AUTHKEY=.*/TS_AUTHKEY=$ts_authkey/" "$compose_file"
# sudo docker-compose up -d
# cd ~/raspi-sb
# if sudo docker ps | grep -q "tailscale"; then
#    echo "Tailscale is now installed."
#    echo "https://${ip_addr}/admin"
#    sleep 1
# else
#    echo "Tailscale is not running. Please check your installation."
# fi


# echo "Refer to documentation for key"
# echo "https://login.tailscale.com/admin/settings/keys"