#!/bin/bash

sudo apt install -y ufw
sudo ufw limit 22
sudo ufw allow 53,67,80,3000,8000,9443/tcp
sudo ufw allow 53,67,80,3000,8000,9443/udp
sudo ufw enable 
sudo ufw status