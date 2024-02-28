#!/bin/bash
echo "Installing Pihole"
cp -rf ~/raspi-sb/pihole/ ~/ 
cd ~/pihole
sed -i "s|- /pihole/etc-pihole:/etc/pihole|- /home/${user}/pihole/etc-pihole:/etc/pihole|" docker-compose.yml
sed -i "s|- /pihole/etc-dnsmasq.d:/etc/dnsmasq.d|- /home/${user}/pihole/etc-dnsmasq.d:/etc/dnsmasq.d|" docker-compose.yml
compose_file=~/raspi-sb/pihole/docker-compose.yml
# Create password to access pihole web interface.
user_password=$(pwgen -s 12 1)
sed -i "s/WEBPASSWORD: 'set a secure password here or it will be random'/WEBPASSWORD: '$user_password'/" "$compose_file"
echo "Password updated successfully!"
sudo docker-compose up -d
cd ~/raspi-sb
if sudo docker ps | grep -q "pihole"; then
    echo "Pihole is now installed."
    echo "https://${ip_addr}/admin"
    sleep 1
else
    echo "Pihole is not running. Please check your installation."
fi