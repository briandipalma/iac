# Branch a worktree from a non main/master branch
# $argv[1] is the new branch
# $argv[2] is the source branch
function gwb
    git worktree add -b $argv[1] ../$argv[1] origin/$argv[2]
    cd ../$argv[1]
end
