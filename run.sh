#!/bin/bash

set -eux

# Pleas update the line number 12 and replace "/home/anish" with your $EXECUSER in Dockerfile.
docker run -ti --rm \
  -e DISPLAY=$DISPLAY \
  --cap-add=NET_ADMIN --device /dev/net/tun \
  --shm-size 256M \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v `pwd`/openvpn:/etc/openvpn \
  -v `pwd`/shared:/home/anish/Downloads \
  -e ASSERT_COUNTRY \
  --name openvpn-firefox \
  --dns 1.1.1.1 \
  local/docker-openvpn-firefox \
  "$@"
