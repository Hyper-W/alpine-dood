FROM alpine:latest

# Your Property
ARG USER=user
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN apk update && apk add --no-cache docker-cli docker-cli-compose docker-cli-buildx sudo \
    && addgroup -g ${GROUP_ID} ${USER} \
    && addgroup docker \
    && adduser -D -u ${USER_ID} -s /bin/sh -G ${USER} ${USER} \
    && adduser ${USER} wheel \
    && adduser ${USER} docker \
    && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

ENV PATH=$PATH:/usr/libexec/docker/cli-plugins/

USER ${USER}