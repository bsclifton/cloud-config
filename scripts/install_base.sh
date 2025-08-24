#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

# Package install
sudo apt-get install -y gcc cowsay curl build-essential libssl-dev libreadline-dev zlib1g-dev zip unzip nginx libffi-dev ruby-psych

# PHP/ MySQL
RANDOM_PW=$(openssl rand -base64 32)
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $RANDOM_PW"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $RANDOM_PW"
sudo apt-get install -y php7.0-fpm php7.0-mysql php7.0-curl php7.0-gd mysql-server mysql-client

# Remove unnecessary packages
sudo apt-get remove -y vim-tiny ppp pppconfig pppoeconf nano
sudo apt-get autoremove -y
