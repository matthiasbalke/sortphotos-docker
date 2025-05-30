#!/bin/bash

echo ">> resetting test bed..."
mv target/**/* source/ || true
echo "done."
echo ""

echo ">> updating docker image..."
docker pull ghcr.io/matthiasbalke/sortphotos:main
echo "done."
echo ""

echo ">> sorting images..."
docker run \
  --mount type=bind,src=$(pwd)/source,dst=/source \
  --mount type=bind,src=$(pwd)/target,dst=/target \
  --rm -it ghcr.io/matthiasbalke/sortphotos:main \
  --recursive /source /target
echo "done."
echo ""

echo ">> listing target..."
ls -alR --color target
echo "done."
