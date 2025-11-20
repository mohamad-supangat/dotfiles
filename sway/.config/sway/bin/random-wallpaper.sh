#!/bin/bash
# filepath: ~/.config/sway/scripts/set_random_bg.sh

# Default ke mode lokal jika tidak ada argumen
INTERNET_MODE=false
IMAGE_DIR="$HOME/Pictures/Wallpapers" # Direktori gambar lokal default
IMAGE_URL="https://picsum.photos/1920/1080" # URL gambar acak internet (resolusi 1920x1080)
TEMP_IMAGE="/tmp/sway_random_bg_$(date +%s).jpg" # File sementara yang unik

killall swaybg

# Periksa argumen untuk menentukan mode
if [[ "$1" == "--internet" ]]; then
    INTERNET_MODE=true
    shift # Hapus argumen --internet agar argumen lain bisa digunakan untuk URL jika ada
elif [[ "$1" == "--local" ]]; then
    INTERNET_MODE=false
    shift # Hapus argumen --local
    IMAGE_DIR="${1:-$IMAGE_DIR}" # Gunakan argumen selanjutnya sebagai direktori lokal jika ada
fi

if [[ "$INTERNET_MODE" == true ]]; then
    echo "Mengunduh gambar acak dari internet: $IMAGE_URL"
    # Menggunakan curl untuk mengunduh gambar, menangani potensi kesalahan
    if ! curl -sL -o "$TEMP_IMAGE" "$IMAGE_URL"; then
        echo "Error: Gagal mengunduh gambar dari internet." >&2
        rm -f "$TEMP_IMAGE" # Bersihkan jika unduhan gagal
        exit 1
    fi

    if [ -f "$TEMP_IMAGE" ]; then
        echo "Mengatur latar belakang dari internet: $TEMP_IMAGE"
        swaybg -i "$TEMP_IMAGE" -m fill
        rm -f "$TEMP_IMAGE" # Bersihkan file sementara setelah digunakan
    else
        echo "Error: Gambar sementara tidak ditemukan setelah diunduh." >&2
        exit 1
    fi
else
    # Logika gambar lokal yang sudah ada
    # Pastikan direktori ada
    if [ ! -d "$IMAGE_DIR" ]; then
        echo "Error: Direktori gambar tidak ditemukan: $IMAGE_DIR" >&2
        exit 1
    fi

    find "$IMAGE_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n 1 | while read -r image; do
      if [ -n "$image" ]; then
        echo "Mengatur latar belakang dari lokal: $image"
        swaybg -i "$image" -m fill
      else
        echo "Tidak ada gambar ditemukan di $IMAGE_DIR" >&2
        exit 1
      fi
    done
fi

exit 0
