#!/bin/bash

cmd="$1"

docker run --rm -it -e UID=$(id -u) -e GID=$(id -g) -v ${PWD}/kolla:/etc/kolla -v ${PWD}/inventory:/opt/inventory kolla $cmd