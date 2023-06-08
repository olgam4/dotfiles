#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

source $HOME/.config/sketchybar/colors.sh

WIFI=${INFO:-"Not Connected"}

sketchybar --set $NAME label="${WIFI}" icon.color="$COLOR12"
