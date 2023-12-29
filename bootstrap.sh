#!/bin/bash

set -ex
pip install --user ansible

ansible-playbook dev-laptop.yaml
