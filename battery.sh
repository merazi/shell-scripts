#!/usr/bin/env bash

# this script returns the battery percentage
# I use this for dwmblocks

acpi | awk -F, '{print $2}' | xargs
