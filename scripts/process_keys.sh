#!/bin/bash

# New key for use w/ GitHub (public key needs to be added manually)
ssh-keygen -t rsa -b 4096 -C "brian@clifton.me" -N "" -f ~/.ssh/id_rsa

# Authorized users
BASEDIR="$(dirname "$0")/../keys/"
cat "$BASEDIR"* > ~/.ssh/authorized_keys

# Disallow password auth & PAM for sshd
sudo sed -i 's|[#]*PermitRootLogin yes|PermitRootLogin no|g' /etc/ssh/sshd_config
sudo sed -i 's|[#]*PermitRootLogin without-password|PermitRootLogin no|g' /etc/ssh/sshd_config
sudo sed -i 's|[#]*PasswordAuthentication yes|PasswordAuthentication no|g' /etc/ssh/sshd_config
sudo sed -i 's|UsePAM yes|UsePAM no|g' /etc/ssh/sshd_config
sudo service ssh restart
