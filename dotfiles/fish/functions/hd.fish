function hd --description 'pick an idle herdr session (every pane sitting at its shell) with fzf, then stop and delete it'
    set -l idle
    for session in (herdr session list | tail -n +2 | awk '$2 == "running" {print $1}')
        set -l busy 0
        for pane in (herdr --session $session pane list | jq -r '.result.panes[].pane_id')
            set -l fg (herdr --session $session pane process-info --pane $pane \
                | jq -r '.result.process_info | .foreground_process_group_id == .shell_pid')
            if test "$fg" != true
                set busy 1
                break
            end
        end
        test $busy -eq 0; and set -a idle $session
    end

    test (count $idle) -gt 0; or begin
        echo 'no idle herdr sessions' >&2
        return 1
    end

    set -l session (printf '%s\n' $idle | fzf --header 'idle herdr sessions')
    test -n "$session"; or return 1
    herdr session stop $session; or return 1
    herdr session delete $session; or return 1
    echo "stopped and deleted $session"
end
