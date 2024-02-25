if gum confirm "DO YOU WANT TO START THE INSTALLATION NOW?" ;then
        echo "Installation started."
    elif [ $? -eq 130 ]; then
            exit 130
    else
        echo "Installation canceled."
        exit;
    fi