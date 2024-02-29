#!/bin/bash
while true
do
  echo ''
  echo '*********************************'
  echo '******* Repair Installation *****'
  echo '*********************************'
  echo '1. Portainer'
  echo '2. Pihole'
  echo '3. WatchTower'
  echo '4. Fail2Ban'
  echo '5. UFW'
  echo '6. Exit'
  read option
    if [[ $option == "1" ]]; then
    source .repair/portainer.sh
  elif [[ $option == "2" ]]; then
    source .repair/pihole.sh
  elif [[ $option == "3" ]]; then
    source .repair/watchtower.sh
  elif [[ $option == "4" ]]; then
    source .repair/fail2ban.sh
  elif [[ $option == "5" ]]; then
    source .repair/ufw.sh
  elif [[ $option == "6" ]]; then
    exit
  else
    2>/dev/null
    echo 'Incorrect command. Try again.'
  fi
done