#!/bin/bash

# Define admin credentials
ADMIN_USER="sysadmin"
ADMIN_PASSWORD="Netlab!23"

# Function to add a user
add_user() {
    USERNAME=$1
    FULLNAME=$2
    PASSWORD=$3
    EXPIRE_DATE=$4
    
    useradd -m -c "$FULLNAME" -e "$EXPIRE_DATE" "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd
    passwd --expire "$USERNAME"
}

# Function to add a group
add_group() {
    GROUPNAME=$1
    shift
    USERS=$@
    
    groupadd "$GROUPNAME"
    for USER in $USERS; do
        usermod -aG "$GROUPNAME" "$USER"
    done
}

# Function to set directory permissions
set_permissions() {
    DIRECTORY=$1
    OWNER=$2
    GROUP=$3
    PERMISSIONS=$4
    
    mkdir -p "$DIRECTORY"
    chown "$OWNER:$GROUP" "$DIRECTORY"
    chmod "$PERMISSIONS" "$DIRECTORY"
}

# Add users with specified expiration dates
add_user "pouzalby" "Pan OuzaIby" "Uziv01-Heslo_3" ""
add_user "jtrnka1" "Jakub Trnka1" "Uziv01-Heslo_3" "$(date -d '+1 year' +%Y-%m-%d)"
add_user "tsimakova" "Tereza Simakova" "Uziv01-Heslo_3" "$(date -d '+1 year' +%Y-%m-%d)"
add_user "mmrazek" "Martin Mrazek" "Uziv01-Heslo_3" "$(date -d '+2 years' +%Y-%m-%d)"
add_user "jkulisova" "Jitka Kulisova" "Uziv01-Heslo_3" "$(date -d '+4 years' +%Y-%m-%d)"

# Create groups and add users to groups
add_group "vyucujici" "pouzalby"
add_group "zak" "jtrnka1" "tsimakova" "mmrazek" "jkulisova"
add_group "1rocnik" "jtrnka1"
add_group "2rocnik" "tsimakova"
add_group "3rocnik" "mmrazek"
add_group "4rocnik" "jkulisova"
add_group "maturita" "jkulisova"

# Set directory permissions
set_permissions "/web/1rocnik" "pouzalby" "1rocnik" "770"
set_permissions "/web/2rocnik" "pouzalby" "2rocnik" "770"
set_permissions "/web/3rocnik" "pouzalby" "3rocnik" "770"
set_permissions "/web/4rocnik" "pouzalby" "4rocnik" "770"
set_permissions "/web/maturita" "pouzalby" "maturita" "770"

# Create index.html in each directory
echo "<html><body><h1>Index for 1. rocnik</h1></body></html>" > /web/1rocnik/index.html
echo "<html><body><h1>Index for 2. rocnik</h1></body></html>" > /web/2rocnik/index.html
echo "<html><body><h1>Index for 3. rocnik</h1></body></html>" > /web/3rocnik/index.html
echo "<html><body><h1>Index for 4. rocnik</h1></body></html>" > /web/4rocnik/index.html
echo "<html><body><h1>Index for maturita</h1></body></html>" > /web/maturita/index.html

# Set key pairs for SSH login
mkdir -p /home/pouzalby/.ssh /home/jtrnka1/.ssh /home/tsimakova/.ssh /home/mmrazek/.ssh /home/jkulisova/.ssh

echo "ssh-rsa AAA... pouzalby_key" > /home/pouzalby/.ssh/authorized_keys
echo "ssh-rsa BBB... jtrnka1_key" > /home/jtrnka1/.ssh/authorized_keys
echo "ssh-rsa CCC... tsimakova_key" > /home/tsimakova/.ssh/authorized_keys
echo "ssh-rsa DDD... mmrazek_key" > /home/mmrazek/.ssh/authorized_keys
echo "ssh-rsa EEE... jkulisova_key" > /home/jkulisova/.ssh/authorized_keys

chown -R pouzalby:pouzalby /home/pouzalby/.ssh
chown -R jtrnka1:jtrnka1 /home/jtrnka1/.ssh
chown -R tsimakova:tsimakova /home/tsimakova/.ssh
chown -R mmrazek:mmrazek /home/mmrazek/.ssh
chown -R jkulisova:jkulisova /home/jkulisova/.ssh

chmod 700 /home/*/.ssh
chmod 600 /home/*/.ssh/authorized_keys

echo "Script execution completed."
