#!/bin/bash

# Install rbenv - https://github.com/rbenv/rbenv
pushd .
rm -rf ~/.rbenv/
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
popd

# Install ruby-build - https://github.com/rbenv/ruby-build#readme
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install latest stable Ruby version
source ~/.bashrc
# TODO: this currently has a problem on install which requires manually
# logging in and re-running `source ~/bashrc`
RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install 3.4.5
rbenv global 3.4.5

# Specific ruby gems
gem install rails bundler jekyll
rbenv rehash
