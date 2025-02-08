#!/bin/bash

apk add --update nodejs npm

source .env

npm install dotenv

node ./scripts/index.js
env > env.log
