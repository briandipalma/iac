#! /bin/bash

source inventory.sh

DEV_DIR=$HOME/dev

if [[ ! -d $DEV_DIR/m/mono && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  git clone https://gitlab.caplin.com/front-end/mono.git $DEV_DIR/m/mono
  cp ./files/post-checkout $DEV_DIR/m/mono/.git/hooks/
  chmod u+x $DEV_DIR/m/mono/.git/hooks/post-checkout
fi

if [[ ! -d $DEV_DIR/fx-integration-api && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  git clone https://gitlab.caplin.com/integration/fx-integration-api.git $DEV_DIR/fx-integration-api
fi
