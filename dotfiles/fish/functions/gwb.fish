# Create a worktree based on a specified branch
# $argv[1] is the new branch
# $argv[2] is the source branch
# If only $argv[1] is given and it already exists as a local branch,
# the worktree is created with that existing branch checked out.
function gwb
    set new_branch $argv[1]
    set source_branch $argv[2]

    git pull

    if not set -q argv[2]
        if git show-ref --exists refs/heads/$new_branch
            git worktree add ../$new_branch $new_branch
            and cd ../$new_branch
            or return

            # Bring the existing branch up to date with origin, if it is on origin
            if git fetch origin $new_branch 2>/dev/null
                git merge --ff-only origin/$new_branch
                or echo "gwb: $new_branch has diverged from origin/$new_branch, left as is" >&2
            end
            return
        end

        set source_branch $new_branch
    end

    git show-ref --exists refs/remotes/origin/$source_branch

    if test $status -eq 0
        git worktree add -b $new_branch ../$new_branch origin/$source_branch
    else
        git worktree add -b $new_branch ../$new_branch
    end
    and cd ../$new_branch
end
