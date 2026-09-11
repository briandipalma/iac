function gwr
    set -l WT ""

    if set -q argv[1]; and test -n "$argv[1]"
        set -l target $argv[1]

        for wt in (git worktree list --porcelain | string replace -rf '^worktree (.+)' '$1')
            set -l wt_abs $wt
            set -l wt_base (basename $wt)
            set -l input_abs (realpath $target 2>/dev/null; or echo "")
            set -l input_parent_abs (realpath ../$target 2>/dev/null; or echo "")

            if test "$target" = "$wt_abs" -o "$target" = "$wt_base" -o "$input_abs" = "$wt_abs" -o "$input_parent_abs" = "$wt_abs"
                set WT $wt
                break
            end
        end
        if test -z "$WT"
            echo "gwr: '$target' is not a valid worktree."
        end
    end

    if test -z "$WT"
        set WT (fd --type d --max-depth 1 . ../ | fzf --height 15 --reverse)
    end

    if test -n "$WT"
        git worktree remove $WT
        git branch --delete (basename $WT)
    end
end
