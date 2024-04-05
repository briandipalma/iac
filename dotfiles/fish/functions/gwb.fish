# Create a worktree based on a specified branch
# $argv[1] is the new branch
# $argv[2] is the source branch
function gwb
    set new_branch $argv[1]
    set source_branch $argv[2]

    if not set -q argv[2]
        set source_branch $new_branch
    end

    git pull
    git show-ref --exists refs/remotes/origin/$source_branch

    if test $status -eq 0
        git worktree add -b $new_branch ../$new_branch origin/$source_branch
    else
        git worktree add -b $new_branch ../$new_branch
    end

    cd ../$new_branch
end
