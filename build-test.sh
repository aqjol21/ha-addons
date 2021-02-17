#!/bin/sh -e
ADDON_NAME=$1
GITHUB_URL="https://gitlab.com/connected-home/ha-addons.git"
docker run --rm --privileged --network host --name "${ADDON_NAME}" \
        -v /data/ch-gitlab-runner/root:/root \
	-v "$(pwd)":/docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
        hassioaddons/build-env:latest \
        --target "${ADDON_NAME}" \
        --all \
	--no-cache \
        --from "homeassistant/{arch}-base" \
        --author "Baurzhan Taishinov <baurzhan@gmail.com>" \
        --doc-url "${GITHUB_URL}"