#!/usr/bin/env bash

# this script returns the battery percentage

acpi | awk -F, '{print $2}' | xargs
