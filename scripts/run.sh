#!/bin/bash

env > env.log

ls /artifacts

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js
