#! /bin/bash

source inventory.sh

DEV_DIR=$HOME/dev

if [[ ! -d $DEV_DIR/mono/master && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  git clone https://gitlab.caplin.com/front-end/mono.git $DEV_DIR/mono/master
  cp ./files/post-checkout $DEV_DIR/mono/master/.git/hooks/
  chmod u+x $DEV_DIR/mono/master/.git/hooks/post-checkout
fi

if [[ ! -d $DEV_DIR/fx-integration-api/main && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  git clone https://gitlab.caplin.com/integration/fx-integration-api.git $DEV_DIR/fx-integration-api/main
fi
