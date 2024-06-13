#!/bin/bash

# Remove carriage returns (if any)
sed -i 's/\r$//' stvoreni-uzivatelu-manualne.sh

# Make the script executable
chmod +x stvoreni-uzivatelu-manualne.sh

# Define the default password
default_password="Uvodni-Heslo_1"

# Create users with full names and set default password
sudo useradd -c "Pan Dulezity" pulezity
echo "pulezity:$default_password" | sudo chpasswd

sudo useradd -c "Jakub Hrabal" jhrabal
echo "jhrabal:$default_password" | sudo chpasswd

sudo useradd -c "Tereza Simakova" tsimakova
echo "tsimakova:$default_password" | sudo chpasswd

sudo useradd -c "Matin Mrazek" mmrazek
echo "mmrazek:$default_password" | sudo chpasswd

sudo useradd -c "Jitka Kuliskova" jkuliskova
echo "jkuliskova:$default_password" | sudo chpasswd

echo "Users created successfully with default password."
