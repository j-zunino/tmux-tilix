#!/usr/bin/env bash

# TODO:
# [x] Switch to layout: Zoom
# [ ] Switch to layout: Main Vertical
# [ ] Switch to layout: Main Horizontal
# [ ] Switch to layout: Even Vertical
# [ ] Switch to layout: Even Horizontal
# [ ] Switch to layout: Tiled
# [ ] Floating pane

for opt in configpath shiftnum layout; do
    export "$opt"="$(tmux show-option -gv @tilix-"$opt" 2>/dev/null)"
done

# Default config path
if [ -z "$configpath" ]; then
    configpath="$HOME/.config/tmux/tmux.conf"
fi

# Default to US keyboard layout
if [ -z "$shiftnum" ]; then
    shiftnum=")!@#$%^&*("
fi

# Hooks
if [ -n "${layout:-}" ]; then
    tmux set-hook -g window-linked "select-layout \"$layout\"; select-layout -E"
    tmux set-hook -g after-split-window "select-layout; select-layout -E"
    tmux set-hook -g after-kill-pane "select-layout; select-layout -E"
    tmux set-hook -g after-join-pane "select-layout; select-layout -E"
fi

# Reload config
tmux bind-key -n M-R source-file $configpath \\\; display-message "Reloaded $configpath"

# Detach / Exit
tmux bind-key -n M-E confirm-before -p "Detach from #S (y/n):" detach-client

# Toggle status bar
tmux bind-key -n M-B set-option status

# [ Pane ]
# Focus next/prev pane
tmux bind-key -n M-j select-pane -t :.+
tmux bind-key -n M-k select-pane -t :.-

# Move pane next/prev
tmux bind-key -n M-J swap-pane -D
tmux bind-key -n M-K swap-pane -U

# Create pane
tmux bind-key -n M-n split-pane

# Kill pane
tmux bind-key -n M-q kill-pane

# Resize pane
tmux bind-key -n M-h resize-pane -L 5
tmux bind-key -n M-l resize-pane -R 5

# [ Window ]
# Create window
tmux bind-key -n M-enter new-window

# Kill window
tmux bind-key -n M-Q kill-window

# Switch to window
for i in $(seq 0 9); do
    tmux bind-key -n M-$i \
        if-shell '[ $(tmux display -p "#I") != '$i' ]' \
        "if-shell 'tmux select-window -t :$i' '' 'new-window -t :$i'" \
        "last-window"
done

# Move pane to window
for i in $(seq 0 9); do
    symbol="${shiftnum:i:1}"

    tmux bind-key -n M-$symbol \
        if-shell "tmux join-pane -t :$i" "" \
        "new-window -dt :$i; join-pane -t :$i; select-pane -t top-left; kill-pane" \\\; select-layout \\\; select-layout -E
done

# [ Layout ]
# Zoom
tmux bind-key -n M-z resize-pane -Z

# [ Popup ]
# LazyGit
tmux bind-key -n M-L display-popup \
    -d "#{pane_current_path}" \
    -w 90% \
    -h 90% \
    -E "lazygit"
