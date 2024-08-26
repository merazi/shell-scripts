#!/bin/bash

#Name: 		wsp_notify
#Description: 	Using notify-send, pop-up the current workspace number when changing workspaces
#Requires: 	xfce3-notifyd, libnotify, wmctrl
#Debug mode:	bash -xv /path/to/wsp_notify 2>&1 | tee wsp_notify.log

# make sure that only one instance of this script is running per user
lockfile=/tmp/.wsp_notify.$USER.lockfile
if ( set -o noclobber; echo "locked" > "$lockfile") 2> /dev/null; then
  	trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT
  	echo "wsp_notifyDEBUG: Locking succeeded" >&2

  	# on startup, set the CURRENT_WORKSPACE value
  	CURRENT_WORKSPACE=$(($(wmctrl -d | grep \* | cut -d' ' -f1)+1))
  	# get the workspace names (starts at index 2)
	NAMES=(`xfconf-query -c xfwm4 -p /general/workspace_names | grep -v "Value is an array"`)

  	# every second, query the active workspace number and if different from the previous one, send a notification
	while true
	do
		sleep 0.1
		NEW_WORKSPACE=$(($(wmctrl -d | grep \* | cut -d' ' -f1)+1))	
		NEW_WORKSPACE_NAME="${NAMES[$(($NEW_WORKSPACE-1))]}"
		if [ $CURRENT_WORKSPACE -ne $NEW_WORKSPACE ]; then
		
		    xfconf-query -c xfce4-panel -p /panels/panel-2/autohide-behavior -s 1 && xfconf-query -c xfce4-panel -p /panels/panel-2/autohide-behavior  -s 2
			
			CURRENT_WORKSPACE=$NEW_WORKSPACE
		fi
	done

# can't create lockfile - notify user and quit
else

  	echo "wsp_notifyDEBUG: Lock failed, check for existing process and/or lock file and delete - exiting." >&2
  	exit 1
fi			

exit 0
