#!/bin/bash 
xrandr --output HDMI-0 --mode 1920x1080 --rate 75 &
feh --bg-scale ~/Pictures/dracula.png &
picom -b &
