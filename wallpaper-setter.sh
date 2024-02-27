#!/bin/bash

# set random wallpaper from a directory

# you can set multiple directories separating them with a space (you can also do
# command injection lol)
pics_folder="$HOME/Pictures/"

wallpaper=$(ls $pics_folder | shuf -n1)

xwallpaper --zoom "$pics_folder$wallpaper"

notify-send 'Wallpaper changed.' -i image