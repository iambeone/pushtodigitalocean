#!/bin/bash
docker-machine create --driver digitalocean \
--digitalocean-ssh-key-fingerprint $fingerprint \
--digitalocean-monitoring true \
--digitalocean-access-token $token \
$name
docker-machine env $name --shell sh && eval $(docker-machine env $name --shell sh)
docker load < $file
docker run -d -p $ports $image
ip=$(docker-machine ip $name)
echo ::set-output name=id::$ip
