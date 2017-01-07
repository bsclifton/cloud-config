## cloud-config

Build configuration used for my [GoDaddy Cloud Server](https://cloud.godaddy.com/).

Configuration is installed on top of [Ubuntu 14.04 LTS](http://releases.ubuntu.com/14.04/) (Trusty Tahr).

### Installing

1. Create a server at cloud.godaddy.com (or using the API). Choose the Ubuntu 14.04.4 image.
2. SSH to the host
3. Run the following commands:

```sh
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y git
git clone https://github.com/bsclifton/cloud-config.git
cd cloud-config/ && ./install.sh
```

After the install, the script will print an SSH key to stdout (add this public key to your GitHub profile).

The MySQL root password is also printed; if you miss it, you can reset the root password [using this procedure](https://help.ubuntu.com/community/MysqlPasswordReset).

### About this configuration

This config uses nginx with:
- [PHP using FastCGI Process Manager](https://www.howtoforge.com/installing-nginx-with-php5-fpm-and-mysql-on-ubuntu-14.04-lts-lemp)
- [Ruby using Passenger](https://www.phusionpassenger.com/library/install/nginx/install/oss/trusty/)

Ruby is setup using [rbenv](https://github.com/rbenv/rbenv), defaulted to a fairly recent stable version (2.3.0).

sshd_config is updated to remove root login and to disallow login w/ password. To obtain SSH access, you can put your public key under ./keys and it will be installed to the authorized_keys.

This install will also pull down [my personal dotfiles](https://github.com/bsclifton/dotfiles/) in the user's home directory.

Configuration files (nginx, etc) are now installed for clifton.io, blog.clifton.io.
- nginx config created using [Mozilla SSL Configuration Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- SSL config tested using [Qualys SSL Labs](https://www.ssllabs.com/ssltest/analyze.html) (both sites score an A)
- SSL certificate/key must be manually installed to `/srv/`

### Staying up to date

Once everything is in place and the server is up and running, the next step is to consider maintenance.

There are two scripts which can be ran:
- `~/scripts/maintenance.sh`: this script will run apt-get update and upgrade. This should be ran regularly.
- `~/scripts/upgrade.sh`: this script will run apt-get dist-upgrade. This should only be ran manually.

