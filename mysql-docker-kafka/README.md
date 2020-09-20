docker run -it --name mysqldbz -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpw debezium/example-mysql:0.5


docker exec -it mysqldbz /bin/bash

more /etc/mysql/conf.d/mysql.cnf

log_bin           = mysql-bin
expire_logs_days  = 1
binlog_format     = row
