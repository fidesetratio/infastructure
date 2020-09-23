#!/bin/bash

echo "Mysql Docker for Docker"

docker run -it --name mysqldbz -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=root -e MYSQL_PASSWORD=root debezium/example-mysql:0.5
