#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y git cowsay curl build-essential libssl-dev libreadline-dev zlib1g-dev nodejs

sudo apt-get remove -y vim-tiny ppp pppconfig pppoeconf nano
