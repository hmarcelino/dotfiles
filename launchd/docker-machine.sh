#!/usr/bin/env bash

set -e

DOCKER_MACHINE="serverlocal"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! docker-machine ls | grep "$DOCKER_MACHINE" &>/dev/null; then
  docker-machine create $DOCKER_MACHINE

  VBoxManage controlvm $DOCKER_MACHINE natpf1 "m3u-proxy,tcp,,9090,,9090"
fi

if docker-machine status $DOCKER_MACHINE | grep "Running" &>/dev/null; then
  eval "$(docker-machine env $DOCKER_MACHINE)"
else
  docker-machine start $DOCKER_MACHINE && eval "$(docker-machine env $DOCKER_MACHINE)"
fi

(cd $SCRIPT_DIR && docker-compose up -d)
