#!/bin/zsh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

case $INFO in
  "1Password") INFO="󰟵" ;;
  "Adobe Photoshop 2023") INFO="" ;;
  "Asistente de Redes Captivas") INFO="󰀂" ;;
  "Alacritty") INFO="" ;;
  "Amphetamine") INFO="" ;;
  "Backblaze") INFO="" ;;
  "Bitdefender Endpoint Security Tools") INFO="󰒃" ;;
  "Calculadora") INFO="󰪚" ;;
  "Calendario") INFO="󰧒" ;;
  "Configuración del Sistema") INFO="" ;;
  "Creative Cloud") INFO="" ;;
  "Docker") INFO="󰡨" ;;
  "Finder") INFO="󰀶" ;;
  "Firefox") INFO="󰈹" ;;
  "Google Chrome") INFO="󰊯" ;;
  "iA Writer") INFO="󰴒" ;;
  "Keybase") INFO="󱕵" ;;
  "KeyCastr") INFO="" ;;
  "LaunchBar") INFO="󰌓" ;;
  "loginwindow") INFO="󰍂" ;;
  "Mail") INFO="󰛮" ;;
  "Menú de Kandji") INFO="󰾡" ;;
  "Miro") INFO="󱁉" ;;
  "Música") INFO="" ;;
  "Monitor de Actividad") INFO="" ;;
  "Notational Velocity") INFO="" ;;
  "osascript") INFO="󰯁" ;;
  "Photo Booth") INFO="" ;;
  "Safari") INFO="󰀹" ;;
  "Slack") INFO="󰒱" ;;
  "Spotify") INFO="󰓇" ;;
  "Thunderbird") INFO="󰴃" ;;
  "Velja") INFO="󰄛" ;;
  "Vista Previa") INFO="" ;;
  "zoom.us") INFO="󰨜" ;;
  *)
    ;;
esac

sketchybar --set $NAME label="${INFO:= }"
