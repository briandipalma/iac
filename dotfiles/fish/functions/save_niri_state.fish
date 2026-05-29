function save_niri_state
    set --local function_dir (path resolve (status --current-filename | path dirname))
    set --local output_path (path resolve $function_dir/../../niri/workspace-state.json)

    if not command -q niri
        echo "niri is not installed."
        return 1
    end

    if not command -q jq
        echo "jq is not installed."
        return 1
    end

    set --local workspaces_json (niri msg -j workspaces | string collect)
    set --local windows_json (niri msg -j windows | string collect)
    set --local temp_path (mktemp)

    if test -z "$temp_path"
        echo "Failed to create a temporary file."
        return 1
    end

    # Include each window's workspace metadata so the snapshot is self-contained.
    if not jq \
        --sort-keys \
        -n \
        --arg captured_at (date -Iseconds) \
        --argjson workspaces "$workspaces_json" \
        --argjson windows "$windows_json" \
        '
        {
          captured_at: $captured_at,
          workspaces: (
            $workspaces
            | sort_by(.output // "", .idx, .name // "", .id)
          ),
          windows: (
            $windows
            | sort_by(.workspace_id // 0, .app_id // "", .title // "", .id)
            | map(
                . as $window
                | $window + {
                    workspace: (
                      if $window.workspace_id == null then null
                      else (
                        [ $workspaces[] | select(.id == $window.workspace_id) ]
                        | .[0]
                      )
                      end
                    )
                  }
              )
          )
        }
        ' > "$temp_path"
        rm -f "$temp_path"
        echo "Failed to serialize niri state."
        return 1
    end

    if not mv "$temp_path" "$output_path"
        rm -f "$temp_path"
        echo "Failed to write $output_path."
        return 1
    end

    echo "Saved niri state to $output_path."
end
