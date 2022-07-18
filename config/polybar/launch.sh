#!/usr/bin/env bash

# Terminal all running bar instances
# With IPC enabled
polybar-msg cmd quit

# Without IPC enabled
# killall -q polybar

# Launch polybar
polybar top &
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1-0')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar external &
fi
