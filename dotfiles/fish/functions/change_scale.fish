#!/usr/bin/fish

set focused_output (niri msg --json focused-output)
set output_name (echo $focused_output | jq -r '.name')
set current_scale (echo $focused_output | jq -r '.logical.scale')

if test "$argv[1]" = down
    set new_scale (math $current_scale - 0.1)
else
    set new_scale (math $current_scale + 0.1)
end

niri msg output "$output_name" scale "$new_scale"
