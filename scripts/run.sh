#!/bin/bash

env > env.log

ls -l "$DYNAMIC_DIR" > /artifacts/artifacts_content.log
cat /artifacts/artifacts_content.log

ls / > root_content.log
cat root_content.log

DYNAMIC_DIR=$(ls -d /artifacts/*)

if [ -z "$DYNAMIC_DIR" ]; then
  echo "Error: Could not find dynamic directory in /artifacts using ls -d /artifacts/*"
else
  echo "DYNAMIC_DIR is: $DYNAMIC_DIR"
  ls -l "$DYNAMIC_DIR" > /artifacts/artifacts_content.log
  cat /artifacts/artifacts_content.log
fi
COMPOSE_FILE_PATH="$DYNAMIC_DIR/docker-compose.yml"

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js

docker compose --project-directory /artifacts -f "$COMPOSE_FILE_PATH" build
