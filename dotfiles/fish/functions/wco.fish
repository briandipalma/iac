# Checkout a branch into a worktree, for e.g. code reviews, cd into worktree
# $1 is the branch to checkout
function wco
    git worktree add -b $argv[1] ../$argv[1] origin/$argv[1]
    cd ../$argv[1]
end
