#!/bin/bash
# adding ssh key
mkdir -p ~/.ssh
echo "$private_key" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
docker-machine create --driver digitalocean \
  --digitalocean-ssh-key-fingerprint $fingerprint \
  --digitalocean-monitoring \
  --digitalocean-tags github \
  --digitalocean-access-token $token \
  $name
docker-machine env $name --shell sh && eval $(docker-machine env $name --shell sh)
docker load < $file
docker run -d -p $ports $image
ip=$(docker-machine ip $name)
echo ::set-output name=id::$ip
