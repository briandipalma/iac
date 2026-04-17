#!/usr/bin/fish

# --- 1. Move Slack to Workspace 2 ---
# We fetch the ID for Slack and move it specifically to index 2
set slack_id (niri msg -j windows | jq -r '.[] | select(.app_id == "Slack" or .app_id == "slack") | .id' | head -n 1)

if test -n "$slack_id"
    echo "Moving Slack (ID: $slack_id) to workspace 2..."
    niri msg action move-window-to-workspace 2 --window-id "$slack_id"
else
    echo "Slack instance not found."
end

# --- 2. Move Firefox instances (Skipping Workspace 2) ---
# 1. Fetch Firefox window IDs
# Fish uses (command) for substitution and avoids word splitting issues
set firefox_ids (niri msg -j windows | jq -r '.[] | select(.app_id == "firefox") | .id')

if test -z "$firefox_ids"
    echo "No Firefox instances found."
    exit 0
end

# 2. Set starting workspace index
set workspace_index 1

# 3. Loop through the IDs
for id in $firefox_ids
    # If the index is 2, skip it and go to 3
    if test "$workspace_index" -eq 2
        set workspace_index (math $workspace_index + 1)
    end

    echo "Moving Firefox ID $id to workspace $workspace_index..."

    # Execute the move
    niri msg action move-window-to-workspace "$workspace_index" --window-id "$id"

    # Increment the index
    set workspace_index (math $workspace_index + 1)
end

echo "Successfully redistributed Firefox instances."
