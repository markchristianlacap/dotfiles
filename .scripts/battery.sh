#!/bin/bash

# Battery path (adjust BAT0/BAT1 for your machine)
BAT_PATH="/sys/class/power_supply/BAT1"
capacity=$(cat "$BAT_PATH/capacity")
status=$(cat "$BAT_PATH/status")

# Pick battery icon based on percentage
if [ "$capacity" -ge 90 ]; then
    bat_icon=""
elif [ "$capacity" -ge 60 ]; then
    bat_icon=""
elif [ "$capacity" -ge 40 ]; then
    bat_icon=""
elif [ "$capacity" -ge 15 ]; then
    bat_icon=""
else
    bat_icon=""
fi

# Charging icon overlay
if [ "$status" = "Charging" ]; then
    icon=" $bat_icon"
else
    icon="$bat_icon"
fi

# Kanagawa Dragon colors
if [ "$capacity" -ge 80 ]; then
    color="^c#98bb6c^"   # green
elif [ "$capacity" -ge 40 ]; then
    color="^c#e6c384^"   # yellow
elif [ "$capacity" -ge 15 ]; then
    color="^c#d27e99^"   # pink/red
else
    color="^c#e82424^"   # critical red
fi

# Low battery notification with auto-close (5s)
if [ "$status" = "Discharging" ] && [ "$capacity" -le 15 ]; then
    notify-send -u critical -t 5000 "Battery Low" "Battery at ${capacity}%"
fi

# Reset color
reset="^d^"

echo "${color}${icon} ${capacity}%${reset}"
