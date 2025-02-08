#!/bin/bash

apk add --update docker

DYNAMIC_DIR=$(find /artifacts -maxdepth 1 -type d ! -name artifacts -print)

if [ -z "$DYNAMIC_DIR" ]; then
  echo "Error: Could not find dynamic directory in /artifacts using find"
  exit 1
fi

cd "$DYNAMIC_DIR"
docker compose build
