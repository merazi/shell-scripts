#!/bin/bash

_TERMINAL_APP="mate-terminal"
_CURRENT_DESKTOP=$(xprop -root -notype _NET_CURRENT_DESKTOP | cut -d "=" -f2 | xargs)

if [[ $(pgrep -x $_TERMINAL_APP) ]];
then
	wmctrl -r "Terminal" -t $_CURRENT_DESKTOP;
	wmctrl -a "Terminal";
else     
	notify-send "Terminal Tool" "Opening Mate Terminal" \
		--urgency=low \
		--icon=terminal \
		--expire-time=5
	mate-terminal;
fi
