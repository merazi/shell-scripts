#!/bin/bash

# this program checks if my dropdown terminal
# for is running for the i3-wm scratchpad

if ps aux | grep '[k]itty --name dropdown'
then
  echo 'Dropdown kitty is already running'
else
  kitty --name dropdown & disown;
  notify-send "Kitty Dropdown has been started"
  echo 'Dropdown kitty is not running'
fi

i3-msg 'scratchpad show; move position center';
