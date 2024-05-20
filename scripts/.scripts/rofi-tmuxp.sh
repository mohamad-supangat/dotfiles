#!/bin/env bash
dir="$HOME/.tmuxp/"
selected_project=$(ls $dir | fuzzel --dmenu $projects)
# echo $TERMINAL
echo $dir$selected_project
$TERMINAL -e tmuxp load $dir$selected_project
