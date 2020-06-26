#!/bin/bash

docker run -d \
    --name registry \
    --restart=always \
    -e REGISTRY_PROXY_REMOTEURL=http://registry-1.docker.io \
    -p 4000:5000 \
    -v registry:/var/lib/registry \
    registry:2
