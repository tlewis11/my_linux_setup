#!/bin/bash

apt-get install -y git vim docker.io
groupadd docker
usermod -aG docker tim
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
