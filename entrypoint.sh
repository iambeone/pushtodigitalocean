#!/bin/bash
docker-machine create --driver digitalocean --digitalocean-access-token $token docker-sandbox-$name
docker-machine env $name --shell sh && eval $(docker-machine env $name --shell sh)
ls -la
docker load < $file
docker image ls
eval $(docker run -d -p $ports $image)
