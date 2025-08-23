#!/bin/bash

# Install nvm - https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Install latest stable nodejs version
source ~/.bashrc

nvm install node
