#!/bin/bash

# Path to battery information
BATTERY_PATH="/sys/class/power_supply/BAT1"

# Get battery percentage
BATTERY_LEVEL=$(cat "$BATTERY_PATH/capacity")

# Get charging status (Charging/Discharging/Full)
CHARGING_STATUS=$(cat "$BATTERY_PATH/status")

# Notify if battery is 20% or lower and discharging
if [ "$BATTERY_LEVEL" -le 20 ] && [ "$CHARGING_STATUS" = "Discharging" ]; then
    notify-send "Battery Low" "Battery is at ${BATTERY_LEVEL}%. Plug in the charger."
fi

# Notify if battery is fully charged and charging
if [ "$BATTERY_LEVEL" -ge 98 ] && [ "$CHARGING_STATUS" = "Charging" ]; then
    notify-send "Battery Full" "Battery is fully charged. Unplug the charger."
fi

