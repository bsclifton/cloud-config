#!/bin/bash

# Make backups
sudo cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.bak
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo cp /etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf.bak

# Copy configs
sudo cp ../etc/php5/fpm/php.ini /etc/php5/fpm/php.ini
sudo cp ../etc/nginx/conf.d/*.conf /etc/nginx/conf.d/
sudo cp ../etc/nginx/sites-available/default /etc/nginx/sites-available/default
sudo cp ../etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf

# files used by SSL configurations
sudo mkdir -p /srv/
sudo openssl dhparam -out /srv/dhparam.pem 2048
sudo cp ../srv/gd_bundle-g2-g1.crt /srv/gd_bundle-g2-g1.crt

# Restart services
sudo /etc/init.d/php5-fpm restart
sudo /etc/init.d/nginx restart
