#!/bin/bash

echo "Install Docker Compose"
echo "Patar timotius"


DOCKERCOMPOSE=/usr/local/bin/docker-compose

if [ -f "$DOCKERCOMPOSE" ]
then
	echo "ada ini need to remove it first"
	sudo rm -f $DOCKERCOMPOSE
fi


sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER

docker-compose --version
