#!/bin/bash

echo "Execute"
mkdir jenkinshome
docker run --detach \
	   --publish 8082:8080 \
	   --volume jenkinshome:/var/jenkins_home \
	   --name jenkins-local \
	   jenkinsmsig:1.0

