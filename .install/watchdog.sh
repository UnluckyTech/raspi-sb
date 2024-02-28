#!/bin/bash

sudo apt install -y watchdog
config_file="/etc/watchdog.conf"

# Uncomment the specified lines using sudo and sed
sudo sed -i 's/#\s*watchdog-device.*/watchdog-device = \/dev\/watchdog/' "$config_file"
sudo sed -i 's/#\s*interval.*/interval = 60/' "$config_file"

sudo systemctl start watchdog
sudo systemctl enable watchdog
echo "Watchdog configuration updated successfully."