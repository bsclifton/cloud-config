## cloud-config

Build configuration used for my [GoDaddy Cloud Server](https://cloud.godaddy.com); uses the Ubuntu 14.04.4 LTS (trusty) image.

### Installing

1. Create a server at cloud.godaddy.com (or using the API). Choose the Ubuntu 14.04.4 image.
2. SSH to the host
3. Run the following commands:

```sh
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y git
git clone https://github.com/clifton-io/cloud-config.git
cd cloud-config/ && ./install.sh
```

After the install, the script will print an SSH key to stdout (add this public key to your GitHub profile).

The MySQL root password is also printed; if you miss it, you can reset the root password [using this procedure](https://help.ubuntu.com/community/MysqlPasswordReset).

### About this configuration

This config uses nginx with:
* [PHP using FastCGI Process Manager](https://www.howtoforge.com/installing-nginx-with-php5-fpm-and-mysql-on-ubuntu-14.04-lts-lemp)
* [Ruby using Passenger](https://www.phusionpassenger.com/library/install/nginx/install/oss/trusty/)

Ruby is setup using [rbenv](https://github.com/rbenv/rbenv), defaulted to the latest stable version (2.3.0).

sshd_config is updated to remove root login and to disallow login w/ password. To obtain SSH access, you can put your public key under ./keys and it will be installed to the authorized_keys.

This install will also pull down [my personal dotfiles](https://github.com/bsclifton/dotfiles/) in the user's home directory.

Configuration files (nginx, etc) are not currently installed by this script (yet).
