#!/bin/sh -e
docker run --rm -v "$(pwd)":/mnt:ro koalaman/shellcheck -- *.sh zigbee2mqtt/*.sh
