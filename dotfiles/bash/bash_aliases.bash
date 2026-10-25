# Common aliases shared between Termux/various Debian/Ubuntu machines

alias ..='cd ..'
alias g=git
alias l="ls --hyperlink=auto"
alias la="ls -A --hyperlink=auto"
alias ll="ls -l --hyperlink=auto"

# Host specific bash config
if [ -e "$HOME/.bash_local.bash" ]; then
    source "$HOME/.bash_local.bash"
fi
