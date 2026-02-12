#!/bin/env bash
TERMINAL=$1
dir="$HOME/.tmuxp/"
# selected_project=$(ls $dir | fuzzel --dmenu $projects)
selected_project=$(ls $dir | rofi -dmenu $projects)
# echo $TERMINAL
echo $dir$selected_project
$TERMINAL -e tmuxp load $dir$selected_project
