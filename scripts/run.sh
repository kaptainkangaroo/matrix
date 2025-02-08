#!/bin/bash

apk add --update nodejs

source .env

node ./scripts/index.js
env > env.log
