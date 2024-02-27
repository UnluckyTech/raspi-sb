#!/bin/bash

echo "Installing Tailscale"

sudo apt install lsb-release curl
curl -L https://pkgs.tailscale.com/stable/raspbian/$(lsb_release -cs).noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/tailscale-archive-keyring.gpg] https://pkgs.tailscale.com/stable/raspbian $(lsb_release -cs) main" | sudo tee  /etc/apt/sources.list.d/tailscale.list
sudo apt update

sudo apt install -y tailscale

# insert this at the end of the script when everything is finished.
# sudo tailscale up

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