## cloud-config

Build configuration used for my Digital Ocean Droplet.

This server hosts a few of my websites:
- [clifton.io](https://github.com/bsclifton/clifton.io)
- [mb.clifton.io](https://github.com/bsclifton/mb.clifton.io)

And two websites for the [Morgopolis](https://github.com/morgopolis) organization:
- [mal-game.com](https://github.com/morgopolis/mal-game.com)
- [morgopolis.com](https://github.com/morgopolis/morgopolis.com)

Configuration is installed on top of [Ubuntu 24.04.3 LTS](https://releases.ubuntu.com/noble/) (Noble Numbat).

This repo does not cover mail setup. For that, you [can follow this article](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04).

### Installing

1. Create a new droplet on Digital Ocean. Choose the `Ubuntu 24.04 (LTS) x64` image.
2. SSH to the host (`ssh root@ip-address-here`).
3. [Create a new user with sudo access](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart) and switch to this new user.
```
adduser --gecos GECOS brian
# prompted for password
usermod -aG sudo brian
su - brian
```
4. Run the following commands:
```sh
sudo apt update && sudo apt upgrade -y && sudo apt install -y git
git clone https://github.com/bsclifton/cloud-config.git
cd cloud-config/ && ./install.sh
```

If the install runs into `rbenv: command not found`, you can re-run `./scripts/install_ruby.sh`.

Similarly, if the install has `nvm: command not found` you can re-run `./scripts/install_nodejs.sh`.

After the install, the script will print an SSH key to stdout (add this public key to your GitHub profile).

### About this configuration

Ruby is setup using [rbenv](https://github.com/rbenv/rbenv) and (as of 2025/08/23) is set to 3.4.5.

NVM is installed for nodejs and the latest stable version is used.

sshd_config is updated to remove root login and to disallow login w/ password. To obtain SSH access, you can put your public key under ./keys and it will be installed to the authorized_keys.

This install will also pull down [my personal dotfiles](https://github.com/bsclifton/dotfiles/) in the user's home directory.

Configuration files (nginx, etc) are now installed for [clifton.io](https://github.com/bsclifton/clifton.io), [blog.clifton.io](https://github.com/bsclifton/blog.clifton.io).
- nginx config created using [Mozilla SSL Configuration Generator](https://mozilla.github.io/server-side-tls/ssl-config-generator/)
- SSL config tested using [Qualys SSL Labs](https://www.ssllabs.com/ssltest/analyze.html) (both sites score an A)
- SSL certificate/key must be manually installed to `/srv/`

### Restoring the database
When moving from an old instance, MySQL data can be imported when running as root.
`mysqldump -u root -p --all-databases > /root/mysql_$(date +"%Y%m%d_%H%M%S%N").sql`

Restoring on the new instance looks like this:
`mysql -u root -p -f < mysql_20250824_082011356980463.sql`

NOTE: you may need to run `mysqld --upgrade=FORCE` to fix things after restoring.

### Staying up to date

Once everything is in place and the server is up and running, the next step is to consider maintenance.

There are two scripts which can be ran:
- `~/scripts/maintenance.sh`: this script will run `apt update` and `apt upgrade`. This should be ran regularly.
- `~/scripts/upgrade.sh`: this script will run `apt dist-upgrade`. This should only be ran manually.

SSL certificates are via letsencrypt (certbot):
- new certicate can be requested via `sudo certbot -d yourdomain.tld --nginx`
- renewal can be done via `sudo certbot certonly --nginx` or `sudo certbot --nginx`


