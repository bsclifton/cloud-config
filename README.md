## cloud-config

Build configuration used for my Digital Ocean Droplet (migration in progress from the now EOLed [GoDaddy Cloud Server](https://cloud.godaddy.com/) product).

This server hosts a few of my websites:
- [blog.clifton.io](https://github.com/bsclifton/blog.clifton.io)
- [clifton.io](https://github.com/bsclifton/clifton.io)
- [mb.clifton.io](https://github.com/bsclifton/mb.clifton.io)

And two websites for the [Morgopolis](https://github.com/morgopolis) organization:
- [mal-game.com](https://github.com/morgopolis/mal-game.com)
- [morgopolis.com](https://github.com/morgopolis/morgopolis.com)

Configuration is installed on top of [Ubuntu 16.04.3 LTS](http://releases.ubuntu.com/16.04/) (Xenial Xerus).

### Installing

1. Create a new droplet on Digital Ocean. Choose the Ubuntu 16.04.3 image.
2. Create a new user (TODO: document this)
3. SSH to the host as that new user
4. Run the following commands:

```sh
sudo apt update && sudo apt upgrade -y && sudo apt install -y git
git clone https://github.com/bsclifton/cloud-config.git
cd cloud-config/ && ./install.sh
```

After the install, the script will print an SSH key to stdout (add this public key to your GitHub profile).

The MySQL root password is also printed; if you miss it, you can reset the root password [using this procedure](https://help.ubuntu.com/community/MysqlPasswordReset).

### About this configuration

This config uses nginx with:
- [PHP using FastCGI Process Manager](https://www.howtoforge.com/installing-nginx-with-php5-fpm-and-mysql-on-ubuntu-14.04-lts-lemp)
- [Ruby using Passenger](https://www.phusionpassenger.com/library/install/nginx/install/oss/xenial/)

Ruby is setup using [rbenv](https://github.com/rbenv/rbenv) and (as of 2017/09/03) is set to 2.4.1.

sshd_config is updated to remove root login and to disallow login w/ password. To obtain SSH access, you can put your public key under ./keys and it will be installed to the authorized_keys.

This install will also pull down [my personal dotfiles](https://github.com/bsclifton/dotfiles/) in the user's home directory.

Configuration files (nginx, etc) are now installed for [clifton.io](https://github.com/bsclifton/clifton.io), [blog.clifton.io](https://github.com/bsclifton/blog.clifton.io).
- nginx config created using [Mozilla SSL Configuration Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- SSL config tested using [Qualys SSL Labs](https://www.ssllabs.com/ssltest/analyze.html) (both sites score an A)
- SSL certificate/key must be manually installed to `/srv/`

### Staying up to date

Once everything is in place and the server is up and running, the next step is to consider maintenance.

There are two scripts which can be ran:
- `~/scripts/maintenance.sh`: this script will run `apt update` and `apt upgrade`. This should be ran regularly.
- `~/scripts/upgrade.sh`: this script will run `apt dist-upgrade`. This should only be ran manually.

