#!/bin/bash

# kill the emacs server
killall emacs

# start a new emacs server
emacs --daemon

# show a message confirmation
notify-send 'Emacs server restarted.' --icon=emacs
