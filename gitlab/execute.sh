#!/bin/bash

echo "Gitlab..."

GITLABFOLDER=$(pwd)/gitlab


sudo rm -rf $GITLABFOLDER

mkdir $GITLABFOLDER
mkdir $GITLABFOLDER/config
mkdir $GITLABFOLDER/logs
mkdir $GITLABFOLDER/data

NAME=gitlab

docker stop $NAME
docker rm $NAME

docker run --detach \
    --hostname gitlab.example.com \
    --publish 4443:443 \
    --publish 8888:80 \
    --publish 422:22 \
    --name $NAME \
    --restart always \
    --volume $GITLABFOLDER/config:/etc/gitlab \
    --volume $GITLABFOLDER/logs:/var/log/gitlab \
    --volume $GITLABFOLDER/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
