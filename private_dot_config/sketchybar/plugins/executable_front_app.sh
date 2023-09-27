#!/bin/zsh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

case $INFO in
  "1Password") INFO="󰟵" ;;
  "Acceso a Llaveros") INFO="󱕴" ;;
  "Adobe Photoshop 2023") INFO="" ;;
  "Asistente de Redes Captivas") INFO="󰀂" ;;
  "Alacritty") INFO="" ;;
  "Amphetamine") INFO="" ;;
  "App Store") INFO="" ;;
  "Backblaze") INFO="" ;;
  "bzbmenu") INFO="󰈸" ;;
  "Bitdefender Endpoint Security Tools") INFO="󰒃" ;;
  "Calculadora") INFO="󰪚" ;;
  "calibre") INFO="󱉟" ;;
  "Calendario") INFO="󰧒" ;;
  "Catálogo Tipográfico") INFO="" ;;
  "Centro de control") INFO="󰕮" ;;
  "Configuración del Sistema") INFO="" ;;
  "Creative Cloud") INFO="" ;;
  "Docker") INFO="󰡨" ;;
  "Dropbox") INFO="" ;;
  "FaceTime") INFO="" ;;
  "Finder") INFO="󰀶" ;;
  "Firefox") INFO="󰈹" ;;
  "Google Chrome") INFO="󰊯" ;;
  "iA Writer") INFO="󰴒" ;;
  "iA Presenter") INFO="󰐨" ;;
  "Keybase") INFO="󱕵" ;;
  "KeyCastr") INFO="" ;;
  "Kindle Classic") INFO="" ;;
  "LaunchBar") INFO="󰌓" ;;
  "loginwindow") INFO="󰍂" ;;
  "Mail") INFO="󰛮" ;;
  "Mapas") INFO="" ;;
  "Menú de Kandji") INFO="󰾡" ;;
  "Miro") INFO="󱁉" ;;
  "Música") INFO="" ;;
  "Monitor de Actividad") INFO="" ;;
  "Microsoft Teams") INFO="󰊻" ;;
  "News") INFO="󰎕" ;;
  "Notational Velocity") INFO="" ;;
  "osascript") INFO="󰯁" ;;
  "Photo Booth") INFO="" ;;
  "Safari") INFO="󰀹" ;;
  "ScreenSaverEngine") INFO="" ;;
  "Slack") INFO="󰒱" ;;
  "Spotify") INFO="󰓇" ;;
  "Thunderbird") INFO="󰴃" ;;
  "TV") INFO="" ;;
  "Velja") INFO="󰄛" ;;
  "Vista Previa") INFO="" ;;
  "zoom.us") INFO="󰨜" ;;
  "UserNotificationCenter") INFO="" ;;
  "Compilador de problemas") INFO="" ;;
  *)
    ;;
esac

sketchybar --set $NAME label="${INFO:= }"
