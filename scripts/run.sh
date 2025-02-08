#!/bin/bash

env > env.log

ls / > root_content.log
cat root_content.log

apk add --update nodejs npm

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
COMPOSE_FILE_PATH="$DYNAMIC_DIR/docker-compose.yml"

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js

cd "$DYNAMIC_DIR"
/usr/local/bin/docker compose build
