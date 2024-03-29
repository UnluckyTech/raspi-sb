#!/bin/bash

# Check if "gum" is installed
if dpkg -s "gum" &> /dev/null; then
    echo "Package 'gum' is already installed."
else
    # Install "gum"
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y gum
fi

# Check if "pwgen" is installed
if dpkg -s "pwgen" &> /dev/null; then
    echo "Package 'pwgen' is already installed."
else
    # Install "pwgen"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y pwgen
fi

# Check if "qrencode" is installed
if dpkg -s "qrencode" &> /dev/null; then
    echo "Package 'qrencode' is already installed."
else
    # Install "qrencode"
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y qrencode
fi

# Update and upgrade
sudo apt update && sudo apt -y upgrade