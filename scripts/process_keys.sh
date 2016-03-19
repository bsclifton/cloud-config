#!/bin/bash

# New key for use w/ GitHub (public key needs to be added manually)
#ssh-keygen -t rsa -b 4096 -C "brian@clifton.me" -N "" -f ~/.ssh/id_rsa

# Authorized users
BASEDIR=$(dirname "$0")
#cat $BASEDIR/../keys/* > ~/.ssh/authorized_keys

# Disallow password auth & PAM for sshd
sed -i 's|[#]*PermitRootLogin yes|PermitRootLogin no|g' /etc/ssh/sshd_config
sed -i 's|[#]*PermitRootLogin without-password|PermitRootLogin no|g' /etc/ssh/sshd_config
sed -i 's|[#]*PasswordAuthentication yes|PasswordAuthentication no|g' /etc/ssh/sshd_config
sed -i 's|UsePAM yes|UsePAM no|g' /etc/ssh/sshd_config
service ssh restart
