#!/bin/bash

env > env.log

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js
