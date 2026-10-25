# Common aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Termux specific bash config

alias s="ssh"
alias update="pkg upgrade"

pl() (
  cd ~/storage/downloads/my-data/ &&
    git add . &&
    { git diff --cached --quiet || git commit -m "mob"; } &&
    git pull --rebase &&
    git push
)
