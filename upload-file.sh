#!/usr/bin/env bash
# this script will upload a file to transfer.sh

curl --upload-file $1 http://transfer.sh/merazi_$1
echo "Done!"
