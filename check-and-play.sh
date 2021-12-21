#!/usr/bin/env bash

# I use this script to start a headless audacious daemon
export AUDACIOUS_STATUS="paused"

if [[ $AUDACIOUS_STATUS == "paused" ]]; then
    audacious --play
    export AUDACIOUS_STATUS="playing"
else
    audacious --pause
    export AUDACIOUS_STATUS="pause"
fi
