#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

printf '\nCloning work repos\n'

DEV_DIR=$HOME/dev

if [[ ! -d $DEV_DIR/mono/main ]]; then
  git clone https://gitlab.caplin.com/front-end/mono.git $DEV_DIR/mono/main
  cp ~/dev/iac/hosts/common/files/post-checkout $DEV_DIR/mono/main/.git/hooks/
  chmod u+x $DEV_DIR/mono/main/.git/hooks/post-checkout
fi

if [[ ! -d $DEV_DIR/fx-integration-api/main ]]; then
  git clone https://gitlab.caplin.com/integration/fx-integration-api.git $DEV_DIR/fx-integration-api/main
fi
