#!/usr/bin/env bash

UNDERCOVER_HOME=~/.undercover-mode
STATUS=$(cat $UNDERCOVER_HOME/status)

function undercover-mode-on()
{
    echo "Storing old configs..."
    # store user config
    xfconf-query -c xfce4-desktop \
		 -p /backdrop/screen0/monitoreDP-1/workspace0/last-image \
		 > $UNDERCOVER_HOME/wallpaper.old
    xfconf-query -c xsettings -p /Net/ThemeName > $UNDERCOVER_HOME/gtk.old
    xfconf-query -c xsettings -p /Net/IconThemeName > $UNDERCOVER_HOME/icons.old
    xfconf-query -c xfwm4 -p /general/theme > $UNDERCOVER_HOME/xfwm.old

    # load windows theme
    xfconf-query -c xfce4-desktop\
		 -p /backdrop/screen0/monitoreDP-1/workspace0/last-image \
		 -s $UNDERCOVER_HOME/Windows-10.jpg
    xfconf-query -c xsettings -p /Net/ThemeName -s Windows-10
    xfconf-query -c xsettings -p /Net/IconThemeName -s Windows-10-Icons
    xfconf-query -c xfwm4 -p /general/theme -s Windows-10

    # feedback and save status
    echo "on" > $UNDERCOVER_HOME/status
    xfce4-panel -r
    notify-send "Windows update available!"
}

function undercover-mode-off()
{
    echo "Restoring old configs..."
    # get old configs
    OLD_WALL=$(cat $UNDERCOVER_HOME/wallpaper.old)
    OLD_GTK=$(cat $UNDERCOVER_HOME/gtk.old)
    OLD_ICONS=$(cat $UNDERCOVER_HOME/icons.old)
    OLD_XFWM=$(cat $UNDERCOVER_HOME/xfwm.old)

    # set old configs
    xfconf-query -c xfce4-desktop \
		 -p /backdrop/screen0/monitoreDP-1/workspace0/last-image \
		 -s $OLD_WALL
    xfconf-query -c xsettings -p /Net/ThemeName -s $OLD_GTK
    xfconf-query -c xsettings -p /Net/IconThemeName -s $OLD_ICONS
    xfconf-query -c xfwm4 -p /general/theme -s $OLD_XFWM

    # feedback and remove status
    echo "off" > $UNDERCOVER_HOME/status
    xfce4-panel -r
    notify-send "User configuration restored"
}

if [ "$STATUS" == "on" ]; then
    # if it's turned on, turn it off
    undercover-mode-off
else
    # if it's turned off, turn it on
    undercover-mode-on
fi
