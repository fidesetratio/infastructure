wget https://www.apache.org/dyn/closer.cgi?path=/kafka/2.4.1/kafka_2.12-2.4.1.tgz

tar -xzf kafka_2.12-2.4.1.tgz

cd kafka_2.12-2.4.1
mkdir connect
cd connect


 wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/0.8.3.Final/debezium-connector-mysql-0.8.3.Final-plugin.tar.gz

tar -xzf debezium-connector-mysql-0.8.3.Final-plugin.tar.gz

> cd ../config
> cp connect-distributed.properties debezium.properties
vim debezium.properties
        plugin.path=$KAFKA_HOME/connect

>cd $KAFKA_HOME
>bin/zookeeper-server-start.sh config/zookeeper.properties
>bin/kafka-server-start.sh config/server.properties
>bin/connect-distributed.sh config/debezium.properties
