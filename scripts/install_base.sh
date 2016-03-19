#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y git cowsay curl build-essential libssl-dev libreadline-dev zlib1g-dev nodejs
echo 'export PATH="/usr/games:$PATH"' >> ~/.profile

sudo apt-get remove -y vim-tiny
