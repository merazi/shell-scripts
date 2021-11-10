#!/usr/bin/env bash

# I use this script to start a headless audacious daemon
export STATUS="pause"

if [[ $STATUS == "pause" ]]; then
    audacious --play
    export STATUS="play"
else
    audacious --pause
    export STATUS="pause"
fi
