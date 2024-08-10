#!/bin/bash
status=$(xset q | grep Caps | tr -s ' ' | cut -d ' ' -f 5)
PANEL="<txt>Caps🔒:$status</txt>"
TOOLTIP="<tool>"
TOOLTIP+="Caps lock status"
TOOLTIP+="</tool>"
  echo -e "${PANEL}"
  echo -e "${TOOLTIP}"
