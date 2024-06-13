#!/bin/bash

# Define variables
DOMAIN="intraweb.eduxo.lab"
ROOT_DIR="/var/www/html"
CONF_FILE="/etc/nginx/conf.d/${DOMAIN}.conf"

# Create the server block configuration
cat <<EOF | sudo tee ${CONF_FILE} > /dev/null
server {
    listen 80;
    listen [::]:80;

    server_name ${DOMAIN};

    root ${ROOT_DIR};
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Check Nginx configuration syntax
sudo nginx -t

# Reload Nginx to apply changes
sudo systemctl reload nginx

# Set permissions for /var/www/html if necessary
sudo chown -R nginx:nginx ${ROOT_DIR}
sudo chmod -R 755 ${ROOT_DIR}

echo "Nginx configuration for ${DOMAIN} has been updated and reloaded."
