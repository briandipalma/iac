#! /bin/bash

git diff --no-index --color-words <(curl -fsSL https://raw.githubusercontent.com/moghtech/komodo/refs/heads/main/compose/mongo.compose.yaml) mongo.compose.yaml
