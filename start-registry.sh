#!/bin/bash

docker run -d \
    --name registry \
    --restart=always \
    -e REGISTRY_PROXY_REMOTEURL=http://192.168.7.237:8082 \
    -p 4000:5000 \
    -v registry:/var/lib/registry \
    registry:2
