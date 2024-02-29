#!/bin/bash
portainer_container_id=$(sudo docker ps -a --filter "name=portainer" --format "{{.ID}}")
rm -rf ~/portainer

sudo docker kill $portainer_container_id
sudo docker prune

if command -v docker &> /dev/null; then
    cp -rf ~/raspi-sb/portainer/ ~/ 
    cd ~/portainer
    sed -i "s|- /portainer:/data|- /home/${user}/portainer:/data|" docker-compose.yml
    sudo docker-compose up -d
    cd ~/raspi-sb
    # Check if Portainer container is running
    if sudo docker ps | grep -q "portainer"; then
        echo "Portainer is now installed."
        echo "https://${ip_addr}:9443"
    else
        echo "Portainer is not running. Please check your installation."
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