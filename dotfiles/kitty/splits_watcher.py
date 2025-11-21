from typing import Any

from kitty.boss import Boss
from kitty.window import Window
from kitty.fast_data_types import (current_focused_os_window_id, current_os_window)

# The watcher is applied to the split so `window` is *always* the split window
def on_resize(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    # Skip if this window is already running distrobox, check what it's running
    for process in window.as_dict()['foreground_processes']:
        cmdline = process['cmdline']

        try:
            index = cmdline.index('enter')
            if cmdline[index - 1].endswith("/distrobox"):
                # It's already running distrobox so skip
                return
        except ValueError:
            pass

    last_active_window_id = window.tabref().windows.active_window_history[-1]
    last_active_window = boss.window_id_map.get(last_active_window_id)
    cmdline = last_active_window.as_dict()['cmdline']

    try:
        index = cmdline.index('enter')
        if cmdline[index - 1].endswith("/distrobox"):
            boss.call_remote_control(window, ('send-text', f'--match=id:{window.id}', 'distrobox enter ' + cmdline[index + 1]))
            boss.call_remote_control(window, ('send-key', f'--match=id:{window.id}', 'enter'))
    except ValueError:
            pass
