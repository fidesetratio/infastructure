

1. Execute.sh
2. /etc/elasticsearch/elasticsearch.yml
 find the line that specifies network.host, uncomment it, and replace its value with localhost like this:
 . . .
# ---------------------------------- Network -----------------------------------
#
# Set the bind address to a specific IP (IPv4 or IPv6):
#
network.host: localhost

3.sudo systemctl start elasticsearch
4. sudo systemctl enable elasticsearch
5. curl -X GET "localhost:9200"
{
  "name" : "Elasticsearch",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "qqhFHPigQ9e2lk-a7AvLNQ",
  "version" : {
    "number" : "7.7.1",
    "build_flavor" : "default",
    "build_type" : "deb",
    "build_hash" : "ef48eb35cf30adf4db14086e8aabd07ef6fb113f",
    "build_date" : "2020-03-26T06:34:37.794943Z",
    "build_snapshot" : false,
    "lucene_version" : "8.5.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}


6. Install kibana
sudo apt install kibana
sudo systemctl enable kibana
sudo systemctl start kibana

sudo nano /etc/kibana/kibana.yml
to 0.0.0.0

7. Pake secure passwd
echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users

8. server {
    listen 80;

    server_name your_domain;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

9. sudo apt install logstash
10. folder that you need to check
/etc/logstash/conf.d
11. sudo nano /etc/logstash/conf.d/02-beats-input.conf
12.input {
  beats {
    port => 5044
  }
}
13. Next, create a configuration file called 30-elasticsearch-output.conf
14.sudo nano /etc/logstash/conf.d/30-elasticsearch-output.conf
15. output {
  if [@metadata][pipeline] {
    elasticsearch {
    hosts => ["localhost:9200"]
    manage_template => false
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
    pipeline => "%{[@metadata][pipeline]}"
    }
  } else {
    elasticsearch {
    hosts => ["localhost:9200"]
    manage_template => false
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
    }
  }
}

16. sudo systemctl start logstash
17. sudo systemctl enable logstash
18. sudo apt install filebeat
19. Remember we will go to filebeat not directly to Elastic Search
20. sudo nano /etc/filebeat/filebeat.yml
21. commet this (due to we fokus to filebeat)

...
#output.elasticsearch:
  # Array of hosts to connect to.
  #hosts: ["localhost:9200"]
...


22. Uncomment this 

output.logstash:
  # The Logstash hosts
  hosts: ["localhost:5044"]

23.sudo filebeat modules enable system
24. sudo filebeat modules list
25. 
