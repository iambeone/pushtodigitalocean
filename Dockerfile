FROM docker

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

RUN set -ex && apk --no-cache add sudo

RUN curl -L https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
RUN sudo mv /tmp/docker-machine /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine

COPY entrypoint.sh /entrypoint.sh

CMD "sh entrypoint.sh"
