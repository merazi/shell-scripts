#!/usr/bin/env bash
# this script will upload an image to uguu.se and return the url of
# the image to stdout

curl --silent -i -F files[]=@$1 https://uguu.se/upload.php | \
    grep "url" | \
    awk -F':' '{print $2":"$3}' \
    | sed 's/,//' \
    | sed 's/\\//g' \
    | xargs
