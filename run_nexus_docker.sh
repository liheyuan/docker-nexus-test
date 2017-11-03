#!/bin/bash
NODE_NAME="node-nexus"
DOCKER_NAME="nexus"
VOLUME_DATA='/var/lib/boot2docker/docker_data/nexus'
# env
eval $(docker-machine env $NODE_NAME)
last_id=$(docker ps -l -q)
docker rm -f $last_id

docker run \
    --rm \
    --name $DOCKER_NAME \
    -v "$VOLUME_DATA":/sonatype-work \
    -p 80:8081 \
    -d sonatype/nexus 
