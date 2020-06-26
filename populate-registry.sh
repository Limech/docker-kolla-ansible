#!/bin/bash

./kolla-ansible.sh "kolla-ansible -i multinode pull"
docker images | grep kolla | grep -v local | awk '{print $1,$2}' | while read -r image tag; do
    docker tag ${image}:${tag} operator:4000/${image}:${tag}
    docker push operator:4000/${image}:${tag}
    docker rmi ${image}:${tag}
    docker rmi operator:4000/${image}:${tag}
done

