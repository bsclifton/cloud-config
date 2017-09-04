#!/bin/bash

# Install rbenv - https://github.com/rbenv/rbenv
if [ ! -f ~/.rbenv/bin/rbenv ]; then
  pushd .
  rm -rf ~/.rbenv
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src
  popd
fi

# Install ruby-build - https://github.com/rbenv/ruby-build#readme
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install latest stable Ruby version
source ~/.bashrc
RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install 2.4.1
rbenv global 2.4.1

# Specific ruby gems
gem install rails bundler
rbenv rehash
