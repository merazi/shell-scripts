#!/usr/bin/env bash

# This decreases the volume 10%, I use this with dwm
pactl set-sink-volume @DEFAULT_SINK@ -10% && notify-send "$(pactl get-sink-volume @DEFAULT_SINK@)"
