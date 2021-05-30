#!/usr/bin/env bash

# this returns the battery percentage
acpi | awk -F, '{print $2}' | xargs
