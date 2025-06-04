#!/bin/bash

# use latest official build image from branch main
IMAGE="ghcr.io/matthiasbalke/sortphotos:main"
# use local build image
#IMAGE="matthiasbalke/sortphotos:local"

echo ">> resetting test bed..."
mv test/target/* test/source/ || true
echo "done."
echo ""

echo ">> updating docker image..."
docker pull ${IMAGE}
echo "done."
echo ""

echo ">> sorting images..."
docker run \
  --mount type=bind,src=$(pwd)/test/source,dst=/source \
  --mount type=bind,src=$(pwd)/test/target,dst=/target \
  --rm -it ${IMAGE} \
  --recursive /source /target
echo "done."
echo ""

echo ">> listing target..."
ls -alR --color test/target
echo "done."
