#!/bin/bash
while true
do
    echo "Select what you want to install below:"
    echo "1. Docker"
    echo "2. Portainer"
    echo "3. Pi-hole"
    echo "4. Watchtower"
    echo "5. Fail2Ban"
    echo "6. Tailscale"
    echo "7. UFW"

    read -p "Enter the numbers of the components to install (e.g., 123): " user_choices

    # Check and run selected scripts
    for choice in $(echo "$user_choices" | sed 's/\(.\)/\1 /g'); do
        case "$choice" in
            1) source .install/docker.sh ;;
            2) source .install/portainer.sh ;;
            3) source .install/pihole.sh ;;
            4) source .install/watchtower.sh ;;
            5) source .install/fail2ban.sh ;;
            6) source .install/tailscale.sh ;;
            7) source .install/ufw.sh ;;
            *)
                echo "Invalid choice: $choice"
                ;;
        esac
    done
done