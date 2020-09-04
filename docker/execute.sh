#!/bin/bash

echo "Docker Instalation Begin"

sudo apt update

sudo apt upgrade

sudo apt install docker.io

sudo systemctl enable --now docker

sudo usermod -aG docker $(whoami)

docker --version
