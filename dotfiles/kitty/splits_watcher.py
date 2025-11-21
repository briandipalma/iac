from typing import Any

from kitty.boss import Boss
from kitty.window import Window
from kitty.fast_data_types import current_focused_os_window_id

# def on_load(boss: Boss, data: dict[str, any]) -> None:
#     print("data", data)
#     print("active_tab", boss.active_tab)
#     print("active window", current_focused_os_window_id())
#
#     for keys,values in data.items():
#         print(keys)
#         print(values)
#     for keys,values in data.items():
#         print(keys)
#         print(values)
# def on_load(boss: Boss, data: dict[str, Any]) -> None:
#     for keys,values in data.items():
#         print(keys)
#         print(values)
# boss.call_remote_control(window, ('send-text', f'--match=id:{window.id}', 'hello world'))

def on_resize(boss: Boss, window: Window, data: dict[str, Any]) -> None:
    print("active_tab", boss.active_tab)
    print("active window", current_focused_os_window_id())
    # print("window", window.as_dict())

    tab = window.tabref()
    all_windows = tab.windows
    print("windows", all_windows.id_map[current_focused_os_window_id()].as_dict()['cmdline'])
    cmdline = all_windows.id_map[current_focused_os_window_id()].as_dict()['cmdline']
    last = cmdline[-1]
    second_last = cmdline[-2]
    print("last", last)
    print("second_last", second_last)


    # send some text to the resized window
    boss.call_remote_control(window, ('send-text', f'--match=id:{window.id}', 'distrobox enter work'))
    boss.call_remote_control(window, ('send-key', f'--match=id:{window.id}', 'enter'))
