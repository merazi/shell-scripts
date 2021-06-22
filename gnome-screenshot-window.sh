#!/usr/bin/env bash

# this will let me take a screenshot of the active window
# with gnome-screenshot and save it to a specific directory,
# with the date and time as the file name

gnome-screenshot -w -f "/home/$USER/Pictures/Screenshots/$(date).jpeg"
