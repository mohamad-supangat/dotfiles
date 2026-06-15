#!/usr/bin/env bash

if command -v scrollmsg &>/dev/null; then
    scrollmsg reload
else
    echo "Peringatan: 'scrollmsg' tidak ditemukan, melewati proses reload." >&2
fi

if command -v vibepanel &>/dev/null; then
    # Jika sudah berjalan, kirim sinyal USR1. Jika belum, abaikan error (|| true)
    pgrep -x "vibepanel" &>/dev/null && pkill -USR1 vibepanel || true

    # Jalankan vibepanel di background dan pisahkan dari terminal (disown)
    vibepanel &
    disown
else
    echo "Error: 'vibepanel' tidak ditemukan. Script dihentikan." >&2
    exit 1
fi
