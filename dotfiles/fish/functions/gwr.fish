function gwr
    set WT $(fd --type d --max-depth 1 . ../ | fzf --height 15 --reverse)
    git worktree remove $WT
    git branch --delete $(basename $WT)
end
