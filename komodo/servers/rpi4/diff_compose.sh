#! /bin/bash

git diff --no-index --color-words <(curl -fsSL https://raw.githubusercontent.com/moghtech/komodo/refs/heads/main/compose/periphery.compose.yaml) periphery.compose.yaml
