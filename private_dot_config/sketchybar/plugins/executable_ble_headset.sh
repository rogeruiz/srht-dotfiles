#!/bin/zsh

DEVICES=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq '.SPBluetoothDataType[0].device_connected[]? | select( .[] | .device_minorType == "Headphones") | keys[]')

if [[ -z "$DEVICES" ]]
then
  sketchybar --set $NAME icon.drawing=off label.drawing=off
else
  sketchybar --set $NAME icon.drawing=on label.drawing=on label="$DEVICES"
fi
