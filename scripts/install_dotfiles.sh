#!/bin/bash

ssh-keyscan github.com >> ~/.ssh/known_hosts

pushd .
cd ~
rm -rf .git
git init
git remote add origin git@github.com:bsclifton/dotfiles.git
git fetch
git checkout -f master
git pull
popd
