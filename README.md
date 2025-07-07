# tmux-tilix

Tmux plugin for my workflow. Inspired by [dwm](https://dwm.suckless.org/) keybinds.

## Requirements

- Tmux
- Lazygit (optional)

## Install

Add this to your `tmux.conf`:

```tmux
set -g @plugin 'j-zunino/tmux-tilix'
```

Reload tmux and press <kbd>prefix</kbd> + <kbd>I</kbd>.

## Settings

In your `tmux.config`

```tmux
set -g @tilix-option "value"
```

### Available options

| Option              | Description                                                                                   | Default                    |
| ------------------- | --------------------------------------------------------------------------------------------- | -------------------------- |
| `@tilix-configpath` | Path to your tmux config file                                                                 | `~/.config/tmux/tmux.conf` |
| `@tilix-shiftnum`   | Keyboard shift row (<kbd>Shift</kbd> + <kbd>0</kbd> - <kbd>9</kbd>)                           | `)!@#$%^&*(`               |
| `@tilix-layout`     | Initial window layout (main-vertical, main-horizontal, even-vertical, even-horizontal, tiled) | `main-vertical`            |

## Keybindings

| Keybinding                                                      | Action              |
| --------------------------------------------------------------- | ------------------- |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd>                | Reload config       |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd>                | Detach / Exit       |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>b</kbd>                | Toggle status bar   |
| <kbd>Alt</kbd> + <kbd>j</kbd>                                   | Focus next pane     |
| <kbd>Alt</kbd> + <kbd>k</kbd>                                   | Focus prev pane     |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>j</kbd>                | Move pane next      |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>k</kbd>                | Move pane prev      |
| <kbd>Alt</kbd> + <kbd>n</kbd>                                   | Create pane         |
| <kbd>Alt</kbd> + <kbd>q</kbd>                                   | Kill pane           |
| <kbd>Alt</kbd> + <kbd>h</kbd>                                   | Resize pane left    |
| <kbd>Alt</kbd> + <kbd>l</kbd>                                   | Resize pane right   |
| <kbd>Alt</kbd> + <kbd>enter</kbd>                               | Create window       |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>q</kbd>                | Kill window         |
| <kbd>Alt</kbd> + <kbd>0</kbd> - <kbd>9</kbd>                    | Switch to window    |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd> - <kbd>9</kbd> | Move pane to window |
| <kbd>Alt</kbd> + <kbd>z</kbd>                                   | Layout: Zoom pane   |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>l</kbd>                | LazyGit popup       |

## Credits

Inspired by:

- [tmux-tilish](https://github.com/jabirali/tmux-tilish)
- [tmux-tilit](https://github.com/2KAbhishek/tmux-tilit)
