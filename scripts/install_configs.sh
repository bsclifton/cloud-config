#!/bin/bash

# Make backups
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# Copy configs
sudo cp ./etc/nginx/conf.d/*.conf /etc/nginx/conf.d/
sudo cp ./etc/nginx/sites-available/default /etc/nginx/sites-available/default

# files used by SSL configurations
sudo mkdir -p /srv/
sudo openssl dhparam -out /srv/dhparam.pem 2048
sudo cp ./srv/gd_bundle-g2-g1.crt /srv/gd_bundle-g2-g1.crt

# certbot used for let's encrypt certs
sudo apt install snapd
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
#sudo certbot certonly --nginx
#sudo certbot --nginx

# Restart services
sudo service nginx restart

