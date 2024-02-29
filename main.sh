#!/bin/bash
while true
do
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
  source .install/start.sh
  echo "Installing Required Packages..."
  source .install/prereq.sh
  echo ''
  echo '*********************************'
  echo '******* Select Installation *****'
  echo '*********************************'
  echo '1. Full Installation'
  echo '2. Custom Installation'
  echo '3. Repair Installation'
  echo '4. Exit'
  read option
  if [[ $option == "1" ]]; then
    source .install/docker.sh
    source .install/portainer.sh
    source .install/pihole.sh
    source .install/watchtower.sh
    source .install/fail2ban.sh
    source .install/tailscale.sh
    source .install/ufw.sh
    source .install/summary.sh
  elif [[ $option == "2" ]]; then
    source .install/custom.sh
  elif [[ $option == "3" ]]; then
    source .install/repair.sh
  elif [[ $option == "4" ]]; then
    exit
  else
    2>/dev/null
    echo 'Incorrect command. Try again.'
  fi


done