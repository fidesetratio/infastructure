docker run -it --name mysqldbz -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpw debezium/example-mysql:0.5


docker exec -it mysqldbz /bin/bash


 more /etc/mysql/conf.d/mysql.cnf


wget https://www.apache.org/dyn/closer.cgi?path=/kafka/2.4.1/kafka_2.12-2.4.1.tgz


wget https://downloads.apache.org/kafka/2.4.1/kafka_2.12-2.4.1.tgz

mkdir /opt/kafka
chown -R patar:patar /opt/kafka
tar -xzf kafka_2.12-2.4.1.tgz
cd /opt/kafka
tar -xzf kafka_2.12-2.4.1.tgz
cd kafka_2.12-2.4.1
mkdir connect
cd connect
wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/0.8.3.Final/debezium-connector-mysql-0.8.3.Final-plugin.tar.gz
tar -xzf debezium-connector-mysql-0.8.3.Final-plugin.tar.gz
cd ../config
cp connect-distributed.properties debezium.properties
vim debezium.properties
 change plugin.path=$KAFKA_HOME/connect


cd $KAFKA_HOME
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties
bin/connect-distributed.sh config/debezium.properties

note:please change database.hostname and database.server.name


curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{ "name": "inventory-connector", "config": { "connector.class": "io.debezium.connector.mysql.MySqlConnector", "tasks.max": "1", "database.hostname": "patartimotius", "database.port": "3306", "database.user": "debezium", "database.password": "dbz", "database.server.id": "184054", "database.server.name": "patartimotius", "database.whitelist": "inventory", "database.history.kafka.bootstrap.servers": "localhost:9092", "database.history.kafka.topic": "dbhistory.inventory" } }'

