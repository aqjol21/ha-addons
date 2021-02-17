#!/bin/sh -e
ADDON_NAME=$1
GITHUB_URL="https://github.com/aqjol21/ha-addons.git"
if git diff HEAD~ --name-only|grep "$ADDON_NAME"; then
        docker run --rm --privileged --network host --name "${ADDON_NAME}" \
                -v "$(pwd)":/docker \
                -v /var/run/docker.sock:/var/run/docker.sock \
                hassioaddons/build-env:latest \
                --target "${ADDON_NAME}" \
                --all \
                --no-cache \
                --from "homeassistant/{arch}-base" \
                --author "aqjole" \
                --doc-url "${GITHUB_URL}" \
                --push \
                --login "${DOCKER_LOGIN}" \
                --password "${DOCKER_PASSWORD}"
else
        echo "Build add-on $ADDON_NAME was skipped because source files was not changed"
fi
