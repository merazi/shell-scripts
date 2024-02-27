#!/bin/bash
wmctrl -r $(xdotool getactivewindow getwindowname) -b toggle,maximized_vert,maximized_horz
