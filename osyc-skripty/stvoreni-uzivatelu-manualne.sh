#!/bin/bash

sed -i 's/\r$//' stvoreni-uzivatelu-manualne.sh
chmod +x stvoreni-uzivatelu-manualne.sh


# Create users with full names
sudo useradd -c "Pan Dulezity" pulezity
sudo passwd Uvodni-Heslo_1

sudo useradd -c "Jakub Hrabal" jhrabal
sudo passwd Uvodni-Heslo_1

sudo useradd -c "Tereza Simakova" tsimakova
sudo passwd Uvodni-Heslo_1

sudo useradd -c "Matin Mrazek" mmrazek
sudo passwd Uvodni-Heslo_1

sudo useradd -c "Jitka Kuliskova" jkuliskova
sudo passwd Uvodni-Heslo_1

echo "Users created successfully."
