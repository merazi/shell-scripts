#!/usr/bin/env bash

# this script uploads a file to transfer.sh

printf 'Uploading $1 to transfer.sh'
curl --upload-file $1 https://transfer.sh/$1
