#!/bin/bash

cmd="$1"

add_hosts() {

for hostname in `sort out_stream.txt`
do
    #extract hostnames from hosts file
    ip=`grep -i $hostname.local /etc/hosts | awk '{print $1}'`
    echo "--add-host=${hostname}:${ip}"
done

}


docker run --rm -it $(add_hosts) -e UID=$(id -u) -e GID=$(id -g) -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub  -v ${PWD}/kolla:/etc/kolla -v ${PWD}/inventory:/opt/inventory kolla $cmd
