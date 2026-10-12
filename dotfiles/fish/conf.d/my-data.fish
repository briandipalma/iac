# Machine-private variables kept outside the dotfiles repo
set -l my_data_env ~/dev/my-data/hosts/$hostname/env.fish
if test -f $my_data_env
    source $my_data_env
end
