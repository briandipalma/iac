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

    set -l create_entry 'Create session for working directory'
    set -l choice (begin
            echo $create_entry
            herdr session list | tail -n +2
        end | fzf --header 'herdr sessions')
    test -n "$choice"; or return 1

    if test "$choice" = $create_entry
        herdr --session $cwd_session
        return
    end

    herdr session attach (string split -f1 ' ' -- $choice)
end
