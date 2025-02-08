#!/bin/bash

env > env.log

ls /artifacts > /artifacts/artifacts_content.log
cat /artifacts/artifacts_content.log

apk add --update nodejs npm

npm install dotenv

node ./scripts/index.js