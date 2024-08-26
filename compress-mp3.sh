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
    if [ -d "./$1" ]; then
        read -p "$1 directory already exists! Overwrite?" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "./$1" -v
        fi
    fi
    mkdir "./$1"
}

function convert_files() {
    echo "Compressing files in $working_directory"
    echo "Please wait..."
    for file in *.mp3; do
        file_name=$(basename -- "$file")
        new_name="${file_name%.*}-compressed.mp3"
        lame --silent -b 128 "$file" ./comp/"$new_name"
    done
}

# first create the dictory
create_directory_if_it_doesnt_exist comp

# and then compress the files
convert_files

# then backup the old files
create_directory_if_it_doesnt_exist backup
mv *.mp3 ./backup/

# and put the compressed files inside current dir
mv ./comp/* .
rmdir ./comp

echo "Done!"
