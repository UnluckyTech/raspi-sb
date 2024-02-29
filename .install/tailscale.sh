#!/bin/bash
while true
do
    echo "Installing Tailscale"

    curl -fsSL https://tailscale.com/install.sh | sh
    echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
    echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
    sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
    # insert this at the end of the script when everything is finished.
    echo "Enable TailScale? (y/n)"
    read option
    if [[ $option == "y" ]]; then
        sudo tailscale up --advertise-exit-node
    elif [[ $option == "n" ]]; then
        break
    else
        2>/dev/null
        echo 'Incorrect command. Try again.'
    fi
done
