# Create a worktree based on a specified branch
# $argv[1] is the new branch
# $argv[2] is the source branch
function gwb
    set new_branch $argv[1]
    set source_branch $argv[2]

    if not set -q source_branch
        set source_branch $new_branch
    end

    git worktree add -b $new_branch ../$new_branch origin/$source_branch
    cd ../$new_branch
end
