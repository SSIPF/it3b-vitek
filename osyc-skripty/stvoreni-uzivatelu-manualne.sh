#!/bin/bash

sed -i 's/\r$//' stvoreni-uzivatelu-manualne.sh
chmod +x stvoreni-uzivatelu-manualne.sh


# Create users with full names
sudo useradd -c "Pan Dulezity" pulezity
sudo passwd pulezity

sudo useradd -c "Jakub Hrabal" jhrabal
sudo passwd jhrabal

sudo useradd -c "Tereza Simakova" tsimakova
sudo passwd tsimakova

sudo useradd -c "Matin Mrazek" mmrazek
sudo passwd mmrazek

sudo useradd -c "Jitka Kuliskova" jkuliskova
sudo passwd jkuliskova

echo "Users created successfully."
