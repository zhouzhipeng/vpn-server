#!/usr/bin/env bash

set  -eux

CRATE_NAME=${1:-"vpn-server"}
BIN_NAME="${CRATE_NAME//-/_}"



docker rm -f vpnserver
docker  build --build-arg PACKAGE=${CRATE_NAME} --platform linux/amd64  -t vpnserverimg .
docker run --restart=always -d  -v .:/app --platform linux/amd64 --name vpnserver vpnserverimg tail -f /dev/null
