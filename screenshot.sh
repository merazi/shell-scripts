#!/usr/bin/env bash

# this script takes a screenshot using SCROT(1)
# I use this with dwm, but it is wm agnostic.
# Just make sure that the directory
# ~/Pictures/Screenshots/ does exist.

scrot -s ~/Pictures/Screenshots/"$(date)".png
