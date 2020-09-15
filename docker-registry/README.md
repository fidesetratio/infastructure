Docker Registry

sudo docker pull alpine:latest
sudo docker tag alpine:latest localhost:5000/alpine:latest

alpine                latest  5cb3aa00f899  2 weeks ago  5.53MB
localhost:5000/alpine latest  5cb3aa00f899  2 weeks ago  5.53MB


push them
docker push localhost:5000/alpine:latest

Pull dari server lain
docker pull 10.0.0.1:5000/alpine:latest

Agar kita bisa pull dari Server A maka tambahkan sebuah file /etc/docker/daemon.json di Server B, C, D, dan E dengan isi


{
   "insecure-registries" : ["10.0.0.1:5000"]
}




FULL AUTHENTICATION


sudo apt install apache2-utils

mkdir auth

htpasswd -Bc registry.password testuser


Docker compose

version: '3'

services:
  registry:
    image: registry:2
    ports:
    - "5000:5000"
    environment:
      REGISTRY_AUTH: htpasswd
      REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
      REGISTRY_AUTH_HTPASSWD_PATH: /auth/registry.password
    volumes:
      - ./auth:/auth



docker-compose up --force-recreate

docker login localhost:5000

https://gabrieltanner.org/blog/docker-registry




