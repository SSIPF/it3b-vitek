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

#!/bin/bash

# Create groups
sudo groupadd vyucujici
sudo groupadd zaci
sudo groupadd 1rocnik
sudo groupadd 2rocnik
sudo groupadd 3rocnik
sudo groupadd 4rocnik

# Add users to groups
sudo usermod -a -G vyucujici pulezity
sudo usermod -a -G zaci jhrabal
sudo usermod -a -G zaci tsimakova
sudo usermod -a -G zaci mmrazek
sudo usermod -a -G zaci jkuliskova
sudo usermod -a -G 1rocnik jhrabal
sudo usermod -a -G 2rocnik tsimakova
sudo usermod -a -G 3rocnik mmrazek
sudo usermod -a -G 4rocnik jkuliskova

echo "Groups and users configured successfully."


#!/bin/bash

# Create main directory /www/
sudo mkdir /www

# Create subdirectories
sudo mkdir /www/1rocnik
sudo mkdir /www/2rocnik
sudo mkdir /www/3rocnik
sudo mkdir /www/4rocnik
sudo mkdir /www/maturita

echo "Directories created successfully."

