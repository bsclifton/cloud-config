#!/bin/bash

sudo apt update
sudo apt upgrade -y

# Package install
sudo apt-get install -y gcc cowsay curl build-essential libssl-dev libreadline-dev zlib1g-dev zip unzip nginx libffi-dev ruby-psych

# PHP/ MySQL
RANDOM_PW=$(openssl rand -base64 32)
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $RANDOM_PW"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $RANDOM_PW"
sudo apt install -y mysql-server mysql-client
sudo apt install -y php8.3-fpm php8.3-mysql php8.3-curl php8.3-gd

# Remove unnecessary packages
sudo apt remove -y vim-tiny ppp pppconfig pppoeconf nano
sudo apt autoremove -y
