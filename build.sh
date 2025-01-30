#!/bin/bash
set -e

# ## USAGE ##
#
# sudo DISTRO=docker-image:tag ./build.sh
#
# Builds deb package inside a docker container and copies it into the packages/ folder.

# Extract distro name and version for artifact naming
DISTRO_NAME=$(echo "$DISTRO" | cut -d: -f1)
DISTRO_VERSION=$(echo "$DISTRO" | cut -d: -f2)

docker build \
  --build-arg DISTRO="$DISTRO" \
  -t package-builder \
  .

DEST="packages/${DISTRO_NAME}_${DISTRO_VERSION}"
mkdir -p "$DEST"

container_id="$(docker create package-builder)"
docker cp "$container_id":/build/build/ "$DEST"
docker rm "$container_id"

# I hate docker cp
mv "$DEST/build/"lirc-plugin-tiqlibusb_*.deb "$DEST/"
rm -rf "$DEST/build"
