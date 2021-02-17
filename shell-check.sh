#!/bin/sh -e
docker run --rm -v "$(pwd)":/mnt:ro koalaman/shellcheck -- *.sh l2tp-client/*.sh zigbee2mqtt/*.sh