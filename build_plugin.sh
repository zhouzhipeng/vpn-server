#!/usr/bin/env bash

set  -eux

CRATE_NAME=${1:-"vpn-server"}
BIN_NAME="${CRATE_NAME//-/_}"
SO_FILE="${CRATE_NAME}"


docker exec vpnserver sh -c "cargo build  --locked --release -p ${CRATE_NAME}"
docker cp vpnserver:/app/target/release/${SO_FILE} .


curl 'https://zhouzhipeng.com/files/upload' \
    -H "${AUTH_KEY}" \
    -F "file=@${SO_FILE}"

echo "\n all finished."