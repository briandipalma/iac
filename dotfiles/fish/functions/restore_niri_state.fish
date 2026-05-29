function restore_niri_state
    set --local function_dir (path resolve (status --current-filename | path dirname))
    set --local state_path (path resolve $function_dir/../../niri/workspace-state.json)

    if not test -f "$state_path"
        echo "Saved niri state not found at $state_path."
        return 1
    end

    if not command -q niri
        echo "niri is not installed."
        return 1
    end

    if not command -q jq
        echo "jq is not installed."
        return 1
    end

    if not command -q base64
        echo "base64 is not installed."
        return 1
    end

    set --local used_ids_path (mktemp)

    if test -z "$used_ids_path"
        echo "Failed to create a temporary file."
        return 1
    end

    printf '[]\n' > "$used_ids_path"

    set --local workspace_entries (jq -r '
        .workspaces
        | sort_by(.output // "", .idx)
        | .[]
        | @base64
    ' "$state_path")

    if test -z "$workspace_entries"
        rm -f "$used_ids_path"
        echo "No saved workspaces found in $state_path."
        return 1
    end

    set --local focused_workspace_entry (jq -r '
        [ .workspaces[] | select(.is_focused) ]
        | .[0]
        | if . == null then empty else @base64 end
    ' "$state_path")

    set --local focused_workspace_id

    if test -n "$focused_workspace_entry"
        set focused_workspace_id (printf '%s' "$focused_workspace_entry" | base64 --decode | jq -r '.id')
    end

    set --local current_output
    set --local target_workspace_index 0
    set --local restored_focused_workspace_ref
    set --local restored_focused_workspace_output

    for workspace_entry in $workspace_entries
        set --local workspace_json (printf '%s' "$workspace_entry" | base64 --decode)
        set --local workspace_id (printf '%s' "$workspace_json" | jq -r '.id')
        set --local workspace_idx (printf '%s' "$workspace_json" | jq -r '.idx')
        set --local workspace_name (printf '%s' "$workspace_json" | jq -r '.name // empty')
        set --local workspace_output (printf '%s' "$workspace_json" | jq -r '.output // empty')
        set --local saved_window_entries (jq -r --argjson workspace_id "$workspace_id" '
            .windows
            | map(select(.workspace_id == $workspace_id))
            | sort_by(.id)
            | .[]
            | @base64
        ' "$state_path")
        set --local saved_window_count (count $saved_window_entries)
        set --local live_windows_json (niri msg -j windows | string collect)
        set --local workspace_has_live_match 0

        for saved_window_entry in $saved_window_entries
            set --local saved_window_json (printf '%s' "$saved_window_entry" | base64 --decode)
            set --local saved_app_id (printf '%s' "$saved_window_json" | jq -r '.app_id // ""')
            set --local saved_title (printf '%s' "$saved_window_json" | jq -r '.title // ""')
            set --local preflight_match_id (printf '%s' "$live_windows_json" | jq -r \
                --arg app_id "$saved_app_id" \
                --arg title "$saved_title" \
                --slurpfile used "$used_ids_path" '
                [
                  .[] as $window
                  | select(($window.app_id // "") == $app_id and ($window.title // "") == $title)
                  | select(($used[0] | index($window.id)) == null)
                  | $window.id
                ]
                | .[0] // empty
            ')

            if test -n "$preflight_match_id"
                set workspace_has_live_match 1
                break
            end
        end

        # Unnamed workspaces only persist if at least one matching window is moved onto them.
        if test -z "$workspace_name"; and test "$workspace_has_live_match" -eq 0
            echo "Skipping unnamed workspace $workspace_idx because no matching live windows are available."
            continue
        end

        if test "$workspace_output" != "$current_output"
            set current_output "$workspace_output"
            set target_workspace_index 0
        end

        set target_workspace_index (math $target_workspace_index + 1)

        if test -n "$workspace_output"
            if not niri msg action focus-monitor "$workspace_output"
                rm -f "$used_ids_path"
                echo "Failed to focus monitor $workspace_output."
                return 1
            end
        end

        echo "Setting up workspace $workspace_idx..."

        if not niri msg action focus-workspace "$target_workspace_index"
            rm -f "$used_ids_path"
            echo "Failed to focus workspace $target_workspace_index."
            return 1
        end

        set --local target_ref "$target_workspace_index"

        if test -n "$workspace_name"
            echo "Naming workspace $workspace_idx as $workspace_name..."

            if not niri msg action set-workspace-name "$workspace_name"
                rm -f "$used_ids_path"
                echo "Failed to name workspace $workspace_idx."
                return 1
            end

            set target_ref "$workspace_name"
        end

        if test -n "$focused_workspace_id"; and test "$workspace_id" = "$focused_workspace_id"
            set restored_focused_workspace_ref "$target_ref"
            set restored_focused_workspace_output "$workspace_output"
        end

        if test "$saved_window_count" -eq 0
            echo "No saved windows for workspace $target_ref."
            continue
        end

        set --local moved_window_count 0

        for saved_window_entry in $saved_window_entries
            set --local saved_window_json (printf '%s' "$saved_window_entry" | base64 --decode)
            set --local saved_app_id (printf '%s' "$saved_window_json" | jq -r '.app_id // ""')
            set --local saved_title (printf '%s' "$saved_window_json" | jq -r '.title // ""')
            set --local match_id (printf '%s' "$live_windows_json" | jq -r \
                --arg app_id "$saved_app_id" \
                --arg title "$saved_title" \
                --slurpfile used "$used_ids_path" '
                [
                  .[] as $window
                  | select(($window.app_id // "") == $app_id and ($window.title // "") == $title)
                  | select(($used[0] | index($window.id)) == null)
                  | $window.id
                ]
                | .[0] // empty
            ')

            if test -z "$match_id"
                echo "No live match for app_id=$saved_app_id title=$saved_title"
                continue
            end

            echo "Moving $saved_app_id ($match_id) to workspace $target_ref..."

            if not niri msg action move-window-to-workspace "$target_ref" --window-id "$match_id"
                rm -f "$used_ids_path"
                echo "Failed to move window $match_id to workspace $target_ref."
                return 1
            end

            set --local updated_used_ids_path (mktemp)

            if test -z "$updated_used_ids_path"
                rm -f "$used_ids_path"
                echo "Failed to create a temporary file."
                return 1
            end

            if not jq --argjson id "$match_id" '. + [$id]' "$used_ids_path" > "$updated_used_ids_path"
                rm -f "$updated_used_ids_path"
                rm -f "$used_ids_path"
                echo "Failed to track restored windows."
                return 1
            end

            if not mv "$updated_used_ids_path" "$used_ids_path"
                rm -f "$updated_used_ids_path"
                rm -f "$used_ids_path"
                echo "Failed to update restored window tracking."
                return 1
            end

            set moved_window_count (math $moved_window_count + 1)
        end

        if test "$moved_window_count" -eq 0; and test -z "$workspace_name"
            echo "Workspace $workspace_idx has no live matches, so it may disappear when unfocused."
        end
    end

    if test -n "$restored_focused_workspace_ref"
        if test -n "$restored_focused_workspace_output"
            niri msg action focus-monitor "$restored_focused_workspace_output" >/dev/null
        end

        niri msg action focus-workspace "$restored_focused_workspace_ref" >/dev/null
    end

    rm -f "$used_ids_path"
    echo "Finished restoring niri workspaces from $state_path."
end
