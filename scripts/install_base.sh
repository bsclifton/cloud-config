#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#-------------------------------------------------------------
# Package install
#-------------------------------------------------------------
# curl build-essential libssl-dev libreadline-dev zlib1g-dev nodejs
#>>> for Ruby / nginx / Passenger
#
# mysql-server mysql-client
#>>> MySQL installed with a random root password
#
# php5-fpm php5-mysql php5-curl php5-gd
#>>> for PHP

RANDOM_PW=$(openssl rand -base64 32)
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $RANDOM_PW"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $RANDOM_PW"
sudo apt-get install -y gcc cowsay curl build-essential libssl-dev libreadline-dev zlib1g-dev nodejs mysql-server mysql-client zip unzip
sudo apt-get install -y php7.0-fpm php7.0-mysql php7.0-curl php7.0-gd

# Remove unnecessary packages
sudo apt-get remove -y vim-tiny ppp pppconfig pppoeconf nano
sudo apt-get autoremove -y
