#!/bin/bash

env > env.log

ls -l "$DYNAMIC_DIR" > /artifacts/artifacts_content.log
cat /artifacts/artifacts_content.log

ls / > root_content.log
cat root_content.log

DYNAMIC_DIR=$(ls -d /artifacts/* | grep -v artifacts_content.log)
COMPOSE_FILE_PATH="$DYNAMIC_DIR/docker-compose.yml"

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js

docker compose --project-directory /artifacts -f "$COMPOSE_FILE_PATH" build
