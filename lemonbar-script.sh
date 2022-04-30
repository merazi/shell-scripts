#!/usr/bin/bash

Cal()
{
		DATE=$(date "+%A, %d %B %Y - %R")
		echo -e -n "${DATE}"
}

Workspace()
{
	cur=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	tot=$(xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}')

	# Desktop numbers start at 0. if you want desktop 2 to be in second place,
	# start counting from 1 instead of 0. But wou'll lose a group ;)
	for w in `seq 0 $((cur - 1))`; do line="${line}="; done

	# enough =, let's print the current desktop
	line="${line}|"

	# En then the other groups
	for w in `seq $((cur + 2)) $tot`; do line="${line}="; done

	# don't forget to print that line!
	echo $line
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
done 
