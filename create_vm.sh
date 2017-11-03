#!/bin/bash
NODE_NAME="node-nexus"
VOLUME_DATA='/var/lib/boot2docker/docker_data/nexus'
docker-machine create -d virtualbox $NODE_NAME
# mirror
docker-machine scp ./daemon.json $NODE_NAME:/tmp/
docker-machine ssh $NODE_NAME sudo cp -r /tmp/daemon.json /etc/docker/
# restart
docker-machine restart $NODE_NAME
docker-machine regenerate-certs -f $NODE_NAME
# volume dir important
docker-machine ssh $NODE_NAME "sudo mkdir -p $VOLUME_DATA"
docker-machine ssh $NODE_NAME "sudo chown -R 200 $VOLUME_DATA"
