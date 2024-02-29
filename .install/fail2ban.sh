#!/bin/bash
if command -v docker &> /dev/null; then
    echo "Installing Fail2Ban"
    cp -rf ~/raspi-sb/fail2ban/ ~/ 
    cd ~/fail2ban
    sed -i "s|- /fail2ban/config:/config|- /home/${user}/fail2ban/config:/config|" docker-compose.yml
    sed -i "s|- /fail2ban/log:/var/log:ro|- /home/${user}/fail2ban/log:/var/log:ro|" docker-compose.yml
    sudo docker-compose up -d
    cd ~/raspi-sb
    if sudo docker ps | grep -q "fail2ban"; then
        echo "Fail2Ban is now installed."
        sleep 1
    else
        echo "Fail2Ban is not running. Please check your installation."
    fi
else
    echo "Docker is not installed. Would you like to install it?"
    read option
    if [[ $option == "y" ]]; then
        source .install/docker.sh
    elif [[ $option == "n" ]]; then
        break
    else
    2>/dev/null
    echo 'Incorrect command. Try again.'
    fi
fi