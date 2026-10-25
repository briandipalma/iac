#! /bin/bash

git diff --no-index --color-words <(curl -fsSL https://raw.githubusercontent.com/moghtech/komodo/main/compose/compose.env) compose.env
