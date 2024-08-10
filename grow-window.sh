#!/bin/bash - 
#===============================================================================
#
#          FILE: grow-window.sh
# 
#         USAGE: ./grow-window.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/10/2024 15:32
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#!/bin/bash

# Get the ID of the active window
WINDOW_ID=$(xdotool getactivewindow)

# Get the current width and height of the window
eval $(xdotool getwindowgeometry --shell $WINDOW_ID)
CURRENT_WIDTH=$(echo $WIDTH)
CURRENT_HEIGHT=$(echo $HEIGHT)

# Set the increment for width and height
INCREMENT=100

# Calculate the new width and height
NEW_WIDTH=$((CURRENT_WIDTH + INCREMENT))
NEW_HEIGHT=$((CURRENT_HEIGHT + INCREMENT))

# Resize the window
xdotool windowsize $WINDOW_ID $NEW_WIDTH $NEW_HEIGHT

# uncomment this if you don't have my script lol
~/bin/center-window.sh

