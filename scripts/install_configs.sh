#!/bin/bash

# Make backups
sudo cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.bak
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo cp /etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf.bak

# Copy configs
cp ../etc/php5/fpm/php.ini /etc/php5/fpm/php.ini
cp ../etc/nginx/conf.d/blog.conf /etc/nginx/conf.d/
cp ../etc/nginx/sites-available/default /etc/nginx/sites-available/default
cp ../etc/nginx/snippets/fastcgi-php.conf /etc/nginx/snippets/fastcgi-php.conf

# Restart services
sudo /etc/init.d/php5-fpm restart
sudo /etc/init.d/nginx restart
