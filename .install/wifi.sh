#!/bin/bash

source ~/raspi-box/.install/variable.sh

# Scan for available Wi-Fi networks and extract the BSSID and security type of the network with the strongest signal
read -r bssid <<< $(nmcli device wifi list | awk 'NR==1 {next} {print $1}' | sort -k5nr | head -n 1)

# Store the SSID and security type in variables for further use
SSID=$(nmcli -f SSID,BSSID device wifi list | grep "$bssid" | awk '{print $1}')
SECURITY=$(nmcli device wifi list | awk 'NR>1 {print $9}' | sort -k7nr | head -n 1)
DNS_SERVER="$ip_addr"
echo "Enter Password: "
read PASSWORD

# Display the SSID and security type of the strongest Wi-Fi network
echo "Strongest Wi-Fi network SSID: $SSID"
echo "Security type: $security_type"



# Encode Wi-Fi configuration into a QR code
WIFI_CONFIG="WIFI:T:$SECURITY;S:$SSID;P:$PASSWORD;DNS1:$DNS_SERVER;;"
qrencode -o wifi_config_qr.png "$WIFI_CONFIG"

echo "Wi-Fi QR code generated!"