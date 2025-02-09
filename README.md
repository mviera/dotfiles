# Dot-files

## Prerequisites

You'll need `ansible` so:

    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible


## Installation

    ansible-playbook local.yml

### docker

Set up Docker's `apt` repository
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Then install docker packages
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

```

Then add `mviera` to `docker` group
```
sudo adduser mviera docker
```

### vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Open vim and exec `:PlugInstall`

## Google Chrome extensions

Disable Automatic Gain Control
AWS Extend Switch Roles

## Elgato Wave:3 mic settings

    sudo apt install pavucontrol

Launch `pavucontrol` > `Configuration` > Set profile: `Digital Stereo (IEC958) Output + Mono Input`
