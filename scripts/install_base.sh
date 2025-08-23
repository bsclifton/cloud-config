#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

# Package install
sudo apt-get install -y gcc cowsay curl build-essential libssl-dev libreadline-dev zlib1g-dev zip unzip nginx

# Remove unnecessary packages
sudo apt-get remove -y vim-tiny ppp pppconfig pppoeconf nano
sudo apt-get autoremove -y
