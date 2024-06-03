#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 username"
    exit 1
fi

USERNAME=$1

if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists."
else
    sudo useradd "$USERNAME"
    echo "User $USERNAME created."
fi
