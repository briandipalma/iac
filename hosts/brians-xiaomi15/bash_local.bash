alias update="pkg upgrade"

pl() (
  cd ~/storage/downloads/my-data/ &&
    git add . &&
    { git diff --cached --quiet || git commit -m "mob"; } &&
    git pull --rebase &&
    git push
)
