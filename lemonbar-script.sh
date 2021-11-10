#!/usr/bin/bash

Cal()
{
    DATE=$(date "+%A, %d %B %Y - %R")
        echo -e -n "\uf073 ${DATE}"
}

Workspace() 
{
# get the current desktop number, add 1 because
# xdotool outputs from 0 to 9
    echo -e "$(( $(xdotool get_desktop) + 1 ))"
}

ActiveWindow()
{
    len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
        max_len=40
        if [ "$len" -gt "$max_len" ]; then
            echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
        else
            echo -n "$(xdotool getwindowfocus getwindowname)"
                fi
}

Battery() 
{
    echo -e "$(acpi --battery | awk -F, '{gsub(/ /,""); print $2}')"
}

while true; do
    echo -e "%{l}%{F#00FF00}[$(Workspace)/10] %{F-}$(ActiveWindow)" \
         "%{r}[$(battery.sh) | $(date.sh) | $(time.sh)]";
         sleep 0.05s;
done
