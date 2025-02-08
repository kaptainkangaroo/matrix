#!/bin/bash

env > env.log
ls / > root_content.log
cat root_content.log

apk add --update nodejs npm docker

npm install dotenv
node ./scripts/index.js

DYNAMIC_DIR=$(find /artifacts -maxdepth 1 -type d ! -name artifacts -print)

if [ -z "$DYNAMIC_DIR" ]; then
  echo "Error: Could not find dynamic directory in /artifacts using find"
else
  echo "DYNAMIC_DIR is: $DYNAMIC_DIR"
  ls -l "$DYNAMIC_DIR" > /artifacts/artifacts_content.log
  cat /artifacts/artifacts_content.log
fi

cd "$DYNAMIC_DIR"

echo "--- Docker version ---"
docker version
echo "--- Docker Compose version ---"
docker compose version
echo "--- Which docker compose ---"
which docker compose
echo "--- ls /usr/local/bin ---"
ls -l /usr/local/bin
echo "--- ls /usr/bin ---"
ls -l /usr/bin
echo "--- PATH environment variable ---"
echo $PATH
echo "--- docker info ---"
docker info
echo "--- docker compose config ---"
docker compose config


docker compose build
