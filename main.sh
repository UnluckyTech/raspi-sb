#!/bin/bash
source .install/variable.sh
source .install/colors.sh
clear

cat <<"EOF"
  _____           _____ _        _____ ____  
 |  __ \         |  __ (_)      / ____|  _ \ 
 | |__) |__ _ ___| |__) | _____| (___ | |_) |
 |  _  // _` / __|  ___/ |______\___ \|  _ < 
 | | \ \ (_| \__ \ |   | |      ____) | |_) |
 |_|  \_\__,_|___/_|   |_|     |_____/|____/ 
                                             
                                                                 
EOF
echo -e "${NONE}"
echo "Version: $version"
echo "by UnluckyTech 2024"
echo ""
echo "Installing Required Packages..."
source .install/prereq.sh
source .install/start.sh
source .install/docker.sh
source .install/portainer.sh
source .install/pihole.sh
source .install/watchtower.sh
source .install/fail2ban.sh
source .install/homepage.sh
source .install/tailscale.sh
source .install/ufw.sh

sudo tailscale up

source .install/summary.sh

# echo "Installing Wireguard"
# curl -L https://install.pivpn.io | bash
