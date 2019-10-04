#!/bin/bash
docker-machine create --driver digitalocean --digitalocean-access-token $token $name
docker-machine env $name --shell sh && eval $(docker-machine env $name --shell sh)
docker load < $file
docker run -d -p $ports $image
