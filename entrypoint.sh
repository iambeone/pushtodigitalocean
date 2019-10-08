#!/bin/bash

echo $private_key
echo $fingerprint
# adding agent
apk add --no-cache openssh-client
# adding ssh key
mkdir -p ~/.ssh
echo "$private_key" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
# creating docker machine
docker-machine create --driver digitalocean \
  --digitalocean-ssh-key-fingerprint $fingerprint \
  --digitalocean-monitoring \
  --digitalocean-tags github \
  --digitalocean-access-token $token \
  $name
# set current docker machine
docker-machine env $name --shell sh && eval $(docker-machine env $name --shell sh)
# load docker image from file
docker load < $file
# run docker container
docker run -d -p $ports $image
# returning ip
ip=$(docker-machine ip $name)
echo ::set-output name=id::$ip
