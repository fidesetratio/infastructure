#!/bin/bash

echo "Execute"
FOLDER=$(pwd)/jenkinshome
rm -rf $FOLDER
mkdir $FOLDER

TMP=$(docker stop jenkins-local)
TMP=$(docker rm jenkins-local)
TMP=$(docker run --detach \
	   --publish 8082:8080 \
	   --volume $FOLDER:/var/jenkins_home \
	   --name jenkins-local \
	   --restart always \
	   jenkinsmsig:1.0)

sleep 10
echo "Getting exec"

SECRET=$(docker exec jenkins-local cat var/jenkins_home/secrets/initialAdminPassword)


echo "Please use this secret  : $SECRET"
