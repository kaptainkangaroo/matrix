#!/bin/bash

apk add --update nodejs

node ./scripts/index.js
env > env.log
