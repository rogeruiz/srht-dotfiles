#!/bin/zsh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

if [[ -z "$SSID" ]]; then
  sketchybar --set $NAME label.drawing=off icon=睊
else
  sketchybar --set $NAME label.drawing=on label="$SSID (${CURR_TX}Mbps)" icon=直
fi
