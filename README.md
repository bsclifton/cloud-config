## cloud-config

Build configuration used for my [GoDaddy Cloud Server](https://cloud.godaddy.com); uses the Ubuntu 14.04.4 LTS (trusty) image.

### Installing

1. Create a server at cloud.godaddy.com (or using the API). Choose the 14.04.4 image.
2. SSH to the host
3. Run the following commands:

```sh
sudo apt-get install -y git
git clone https://github.com/clifton-io/cloud-config.git
cd cloud-config/ && ./install.sh
```

4. The script will print an SSH key. Add this public key to your GitHub profile
