#!/bin/zsh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

meses_del_ano=("enero" "febrero" "marzo" "abril" "mayo" "junio" "julio" "agosto" "septiembre" "octubre" "noviembre" "diciembre")

sketchybar --set $NAME label="$(date "+%d de ${meses_del_ano[$(date "+%m")]} %Y %H:%M:%S")"
