#!/bin/bash

echo "Docker Registry"

sudo docker run -d -p 5000:5000 --restart=always --name  registry \
	-v $(pwd)/auth:/auth \
	-e "REGISTRY_AUTH=htpasswd" \
	-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
	-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/registry.password \
registry:2
