#!/usr/bin/env bash

if command -v scrollmsg &>/dev/null; then
    scrollmsg reload
else
    echo "Peringatan: 'scrollmsg' tidak ditemukan, melewati proses reload." >&2
fi

if command -v vibepanel &>/dev/null; then
    pgrep -x "vibepanel" &>/dev/null && pkill -USR1 vibepanel || true
    vibepanel &
    disown
else
    echo "Error: 'vibepanel' tidak ditemukan. Script dihentikan." >&2
    exit 1
fi



pkill -SIGUSR1 nvim
