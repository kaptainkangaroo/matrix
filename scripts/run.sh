#!/bin/bash

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js
env > env.log
