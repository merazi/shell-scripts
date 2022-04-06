#!/usr/bin/bash

Cal()
{
    DATE=$(date "+%A, %d %B %Y - %R")
    echo -e -n "${DATE}"
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
    max_len=100
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

Vol()
{
  VOL=$(pulsemixer --get-volume | awk '{print $1}')
  if [ $(pulsemixer --get-mute) -eq 1 ]; then
    echo "Mute"
  else
    echo -e "$VOL"
  fi
}

while true; do
    echo -e "%{l}%{F#859900}[$(Workspace)/10] %{F-}$(ActiveWindow)" \
      "%{r}[$(battery.sh) | Vol: $(Vol) | $(Cal) ]";
    sleep 0.05;
done 
