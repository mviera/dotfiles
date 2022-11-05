# Dot-files

## Prerequisites

You'll need `ansible` so:

    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible


## Installation

    ansible-pull -U https://github.com/mviera/dotfiles

## Extra packages to install

python3-powerline
fonts-powerline
powerline-gitstatus
ack
scrot
pwgen
jq
feh

### docker
sudo apt install docker docker-compose docker.io
sudo addgroup docker mviera


### vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Open vim and exec `:PlugInstall`

## Google Chrome extensions

Disable Automatic Gain Control
Instapaper
AWS Extend Switch Roles

## Elgato Wave:3 mic settings

    sudo apt install pavucontrol

Launch `pavucontrol` > `Configuration` > Set profile: `Digital Stereo (IEC958) Output + Mono Input`
