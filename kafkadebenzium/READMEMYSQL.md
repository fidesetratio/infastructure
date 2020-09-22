sudo apt-get update
sudo apt-get install mysql-server




Aktifkan Bin Log

CREATE USER 'ubuntu'@'localhost' IDENTIFIED BY 'P@ssw0rd001';
GRANT ALL PRIVILEGES ON * . * TO 'ubuntu'@'localhost';
FLUSH PRIVILEGES;

sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf


uncomment

 server-id              = 1
 log_bin                        = /var/log/mysql/mysql-bin.log
 binlog_expire_logs_seconds     = 2592000
 max_binlog_size   = 100M




SHOW MASTER STATUS\G

