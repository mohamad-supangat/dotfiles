#! /usr/bin/env bash
# ╭──────────────────────────────────────────────────────────╮
# │ https://github.com/davatorium/rofi-scripts               │
# ╰──────────────────────────────────────────────────────────╯
function tmux_sessions()
{
    tmux list-session -F '#S'
}
TMUX_SESSIONS=$(tmux_sessions)
TMUX_SESSION=$( (tmux_sessions) | rofi -dmenu -p "Select tmux session")
TMUX_SESSIONS=(${TMUX_SESSIONS//$'\n'/ })
echo $TMUX_SESSIONS
echo $TMUX_SESSION
if [[ " ${TMUX_SESSIONS[*]} " =~ " ${TMUX_SESSION} " ]]; then
    echo "select exiting"
    rofi-sensible-terminal -e tmux attach -d -t "${TMUX_SESSION}" &
elif [[ -z "${TMUX_SESSION}" ]]; then
    echo "Cancel"
else
    echo "new session"
    rofi-sensible-terminal -e tmux new-session -t "${TMUX_SESSION}" &
fi
