#!/bin/bash

echo "Install Nginx....."
sudo apt update

sudo apt install nginx

sudo systemctl status nginx
