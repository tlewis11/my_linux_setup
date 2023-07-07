#!/bin/bash

set -ex
pip install --user ansible

ansible-playbook dev-laptop.yaml

sudo ln -s $(pwd)/node /usr/local/bin/node
sudo ln -s $(pwd)/node /usr/local/bin/npm
sudo ln -s $(pwd)/node /usr/local/bin/npx


#apt-get install nmap vim sshfs
#mv files/vimrc ~/.vimrc
