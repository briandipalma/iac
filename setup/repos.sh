#! /bin/bash

source inventory.sh

DEV_DIR=$HOME/dev

if [ ! -d $DEV_DIR ]; then
	mkdir $DEV_DIR
fi

if [ ! -d $DEV_DIR/my-data ]; then
	git clone git@github.com:briandipalma/my-data.git $DEV_DIR/my-data
fi

token=$(cat $DEV_DIR/my-data/gitlab_secret)

if [[ ! -d $DEV_DIR/m/mono && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
	git clone https://briand:${token}@gitlab.caplin.com/front-end/mono.git $DEV_DIR/m/mono
fi

if [[ ! -d $DEV_DIR/fx-integration-api && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
	git clone https://briand:${token}@gitlab.caplin.com/integration/fx-integration-api.git $DEV_DIR/fx-integration-api
fi
