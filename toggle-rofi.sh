#!/bin/bash
#

if pgrep -x rofi; then
	killall rofi;
else
	rofi -combi-modi window,drun,ssh -show combi -show-icons -normal-window
fi
