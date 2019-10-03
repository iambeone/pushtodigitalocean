#!/bin/bash
docker-machine create --driver digitalocean --digitalocean-access-token $token docker-sandbox-$name
docker-machine env docker-sandbox-$name --shell sh && eval $(docker-machine env docker-sandbox-$name --shell sh)
ls -la
docker load < /github/workspace/dockerimage2.tgz
eval $(docker run -d -p $ports dockerimage)
