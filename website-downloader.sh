#!/usr/bin/env bash

## This script will download a 1:1 copy of a website in your machine.
## The script needs a website as the first input.

if [ $# -eq 0 ]
then
    echo 'Usage: download-website.sh https://website.com'
else
    echo 'Downloading $1'
    wget --limit-rate=200k --no-clobber --convert-links --random-wait \
	 -r -p -E -e robots=off -U mozilla $1
fi
