#!/usr/bin/env bash

# 1. Cari semua file .desktop yang memiliki kategori WebBrowser
# 2. Ambil nama aplikasi (Name=) dan perintahnya (Exec=)
# 3. Format menjadi: Nama Aplikasi|Perintah
apps_list=$(grep -rl "Categories=.*WebBrowser" /usr/share/applications/ ~/.local/share/applications/ 2>/dev/null | while read -r file; do
    name=$(grep -m 1 "^Name=" "$file" | cut -d'=' -f2)
    exec_cmd=$(grep -m 1 "^Exec=" "$file" | cut -d'=' -f2 | sed 's/%[fruFRU]//g' | xargs)
    if [ -n "$name" ] && [ -n "$exec_cmd" ]; then
        echo "$name|$exec_cmd"
    fi
done | sort -u)

# Buat menu untuk Rofi (hanya menampilkan Nama Aplikasi)
rofi_menu=$(echo "$apps_list" | cut -d'|' -f1)

# Tampilkan Rofi
choice=$(echo "$rofi_menu" | rofi -dmenu -i -p "Select Browser:")

# Jika user memilih browser, ambil perintah Exec-nya lalu jalankan
if [ -n "$choice" ]; then
    exec_cmd=$(echo "$apps_list" | grep "^$choice|" | head -n 1 | cut -d'|' -f2)
    if [ -n "$exec_cmd" ]; then
        eval "$exec_cmd" &
    fi
fi
