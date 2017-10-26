#!/bin/bash

mkdir ~/.ssh/
ssh-keyscan github.com >> ~/.ssh/known_hosts

pushd .
cd ~
rm -rf .git
git init

# Pull using HTTPS
git remote add origin https://github.com/bsclifton/dotfiles.git
git fetch
git checkout -f master
git pull

# Change back to SSH; key will need to be manually added
git remote remove origin
git remote add origin git@github.com:bsclifton/dotfiles.git
popd
