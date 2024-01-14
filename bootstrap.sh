#!/bin/bash

set -ex
pip install --user ansible
export PATH=$PATH:~/.local/bin
ansible-playbook dev-laptop.yaml
