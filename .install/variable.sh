#!/bin/bash
version=$(cat .version/name)
user=$(whoami)
ip_addr=$(ip a show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
portainer= "https://${ip_addr}:9443"
pihole="https://${ip_addr}/admin"
homepage="https://${ip_addr}:8008"