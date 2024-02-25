#!/bin/bash
ip_addr=$(ip a show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
portainer= "https://${ip_addr}:9443"