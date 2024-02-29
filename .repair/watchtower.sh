#!/bin/bash
watchtower_container_id=$(sudo docker ps -a --filter "name=watchtower" --format "{{.ID}}")
rm -rf ~/watchtower

sudo docker kill $watchtower_container_id
sudo docker prune

if command -v docker &> /dev/null; then
    echo "Installing WatchTower"
    cp -rf ~/raspi-sb/watchtower/ ~/ 
    cd ~/watchtower
    sudo docker-compose up -d
    cd ~/raspi-sb
    if sudo docker ps | grep -q "watchtower"; then
        echo "WatchTower is now installed."
        sleep 1
    else
        echo "WatchTower is not running. Please check your installation."
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