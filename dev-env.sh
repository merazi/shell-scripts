#!/bin/bash

# note: I have my xfce configured with a 302 margin on the right side
# for all workspaces. That's why I'm maximizing emacs and floating
# thunar.

# first create a new emacs client (my emacs maximizes automatically)
emacsclient -c &

# spawn a file manager and place it on the right side
thunar &
sleep .1 # my pc is too fast lol
wmctrl -r "thunar" -e 0,1440,0,320,990

# play some music in the background (lofi girl livestream) it also
# kills mpv just in case there's another distracting stream being
# played.
killall mpv
mpv --no-video https://www.youtube.com/watch?v=jfKfPfyJRdk &

# and show me some visual feedback that everything is done
notify-send 'Merazi' 'Happy Hacking!' --icon "$HOME/.face"
