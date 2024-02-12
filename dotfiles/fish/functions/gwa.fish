# Add a worktree and cd into that worktree
# $argv[1] is the new worktree
function gwa
    git worktree add ../$argv[1]
    cd ../$argv[1]
end
