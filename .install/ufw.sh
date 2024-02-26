#!/bin/bash

sudo apt install -y ufw
sudo ufw limit 22
sudo ufw allow 8000 9443 53/tcp 53/udp 67/udp 80/tcp 
sudo ufw enable 
sudo ufw status