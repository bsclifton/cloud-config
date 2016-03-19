#!/bin/bash

# Install rbenv - https://github.com/rbenv/rbenv
pushd .
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
popd

# Install ruby-build - https://github.com/rbenv/ruby-build#readme
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install latest stable Ruby version
source ~/.profile
rbenv install 2.3.0
rbenv global 2.3.0

# Specific ruby gems
gem install rails bundler
rbenv rehash
