function h --description 'attach to a herdr session, picking with fzf if none given'
    if test (count $argv) -gt 0
        herdr session attach $argv
        return
    end

    set -l cwd_session (path basename $PWD)
    if herdr session list | tail -n +2 | awk '{print $1}' | string match -q -- $cwd_session
        herdr session attach $cwd_session
        return
    end

    set -l session (herdr session list | tail -n +2 | fzf --header 'herdr sessions' | awk '{print $1}')
    test -n "$session"; or return 1
    herdr session attach $session
end
