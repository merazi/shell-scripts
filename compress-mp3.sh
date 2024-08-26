#!/bin/bash - 
#===============================================================================
#
#          FILE: compress-mp3.sh
# 
#         USAGE: ./compress-mp3.sh [directory]
# 
#   DESCRIPTION: Compresses all mp3 files in PWD, creates a new directory named
#   "comp" and saves the compressed files there
# 
#       OPTIONS: N/A
#  REQUIREMENTS: lame
#        AUTHOR: merazi, 
#  ORGANIZATION: 
#       CREATED: 08/24/2024 08:42
#===============================================================================

# if no directory entered then use PWD
if [ -z "$1" ]; then
    working_directory=$PWD
else
    working_directory=$1
fi

pushd "$working_directory"

function create_directory_if_it_doesnt_exist() {
    # longest function name ever
    if [ -d "./comp" ]; then
        read -p "comp directory already exists! Overwrite?" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf ./comp -v
        fi
    fi
    mkdir ./comp
}

function convert_files() {
    echo "Converting files in $working_directory"
    for file in *.mp3; do
        file_name=$(basename -- "$file")
        new_name="${file_name%.*}-compressed.mp3"
        lame -b 128 "$file" ./comp/"$new_name"
    done
    echo "Done!"
}

# first create the dictory
create_directory_if_it_doesnt_exist

# and then compress the files
convert_files
