#!/bin/bash

source .install/variable.sh

# Scan for available Wi-Fi networks and extract the SSID and security type of the network with the strongest signal
read -r strongest_ssid security_type <<< $(nmcli device wifi list | awk 'NR==1 {next} {print $1, $5}' | sort -k6nr | head -n 1)

# Display the SSID and security type of the strongest Wi-Fi network
echo "Strongest Wi-Fi network SSID: $strongest_ssid"
echo "Security type: $security_type"
echo "Enter Password: "
read PASSWORD
# Store the SSID and security type in variables for further use
SSID="$strongest_ssid"
SECURITY="$security_type"
DNS_SERVER="$ip_addr"

# Encode Wi-Fi configuration into a QR code
WIFI_CONFIG="WIFI:T:$SECURITY;S:$SSID;P:$PASSWORD;DNS1:$DNS_SERVER;;"
qrencode -o wifi_config_qr.png "$WIFI_CONFIG"

echo "Wi-Fi QR code generated!"