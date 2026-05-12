#!/usr/bin/fish

function change_scale
    set focused_ouput $(niri msg focused-output | awk -F'[()]' 'NR==1 {print $2}')
    set current_scale $(niri msg --json outputs | jq -r ".[\"$focused_ouput\"].logical.scale")

    if test "$argv[1]" = down
        set new_scale (math $current_scale - 0.1)
    else
        set new_scale (math $current_scale + 0.1)
    end

    niri msg output "$focused_ouput" scale "$new_scale"
end
