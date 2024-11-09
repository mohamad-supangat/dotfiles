#! /usr/bin/env bash
# ╭──────────────────────────────────────────────────────────╮
# │ https://github.com/davatorium/rofi-scripts               │
# ╰──────────────────────────────────────────────────────────╯
function tmux_sessions()
{
    tmux list-session -F '#S'
}
TMUX_SESSIONS=$(tmux_sessions)
# TMUX_SESSION=$( (tmux_sessions) | fuzzel --dmenu)
TMUX_SESSION=$( (tmux_sessions) | rofi -dmenu)
TMUX_SESSIONS=(${TMUX_SESSIONS//$'\n'/ })
echo $TMUX_SESSIONS
echo $TMUX_SESSION
if [[ " ${TMUX_SESSIONS[*]} " =~ " ${TMUX_SESSION} " ]]; then
    echo "select exiting"
    $1 -e tmux attach -d -t "${TMUX_SESSION}" &
elif [[ -z "${TMUX_SESSION}" ]]; then
    echo "Cancel"
else
    echo "new session"
    $1 -e tmux new-session -t "${TMUX_SESSION}" &
fi
