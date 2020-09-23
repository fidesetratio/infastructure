#!/bin/bash

<<<<<<< HEAD
docker-compose up -d
=======
echo "ELK Instalation Begin"


wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch

>>>>>>> 002640906dd881715127909c57b263c42558894d
