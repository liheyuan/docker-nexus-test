#!/bin/bash
NODE_NAME="node-nexus"
docker-machine start $NODE_NAME
docker-machine regenerate-certs -f $NODE_NAME 
