#!/bin/bash

# Zkontroluje, zda bylo zadáno uživatelské jméno jako argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 username"
    exit 1
fi

USERNAME=$1

# Zkontroluje, zda uživatel již existuje
if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists."
else
    # Vytvoří nového uživatele
    sudo useradd "$USERNAME"
    if [ $? -eq 0 ]; then
        echo "User $USERNAME created."
    else
        echo "Failed to create user $USERNAME."
    fi
fi
