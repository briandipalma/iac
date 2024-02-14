#! /bin/bash

if [ ! -d $HOME/dev ]; then
	mkdir $HOME/dev
fi

git clone git@github.com:briandipalma/my-data.git $HOME/dev/my-data
