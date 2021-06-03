#!/usr/bin/env bash

# this script returns the free memory
# I use this with dwm

free -h | grep 'Mem:' | awk '{print $3}'
