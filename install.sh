#!/bin/bash
###########
# Must be executed in this order (also- not idempotent)
# would be much better to do this with Ansible or Puppet
###########
source ./scripts/install_base.sh
source ./scripts/install_dotfiles.sh
source ./scripts/process_keys.sh
source ./scripts/install_ruby.sh
source ./scripts/install_passenger.sh
