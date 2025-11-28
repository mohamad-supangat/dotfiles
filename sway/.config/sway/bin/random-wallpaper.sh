#!/bin/bash
# filepath: ~/.config/sway/scripts/set_random_bg.sh

# Default ke mode lokal jika tidak ada argumen
IMAGE_SOURCE="local" # "local", "picsum", "anime"
IMAGE_DIR="$HOME/Pictures/Wallpapers" # Direktori gambar lokal default
PICSUM_URL="https://picsum.photos/1920/1080" # URL gambar acak internet (resolusi 1920x1080)
ANIME_API_URL="https://nekos.life/api/v2/img/wallpaper" # API URL untuk gambar anime
TEMP_IMAGE="/tmp/sway_random_bg_$(date +%s).jpg" # File sementara yang unik

killall swaybg

# Periksa argumen untuk menentukan mode
if [[ "$1" == "--internet" ]]; then
    IMAGE_SOURCE="picsum"
    shift # Hapus argumen --internet
elif [[ "$1" == "--anime" ]]; then
    IMAGE_SOURCE="anime"
    shift # Hapus argumen --anime
elif [[ "$1" == "--local" ]]; then
    IMAGE_SOURCE="local"
    shift # Hapus argumen --local
    IMAGE_DIR="${1:-$IMAGE_DIR}" # Gunakan argumen selanjutnya sebagai direktori lokal jika ada
fi

# Fungsi untuk memeriksa apakah jq terinstal
check_jq_dependency() {
    if ! command -v jq &> /dev/null; then
        echo "Error: 'jq' tidak ditemukan. Diperlukan untuk mode '--anime'." >&2
        echo "Silakan instal 'jq' menggunakan manajer paket Anda (contoh: sudo apt install jq)." >&2
        exit 1
    fi
}

if [[ "$IMAGE_SOURCE" != "local" ]]; then
    DOWNLOAD_URL=""

    if [[ "$IMAGE_SOURCE" == "picsum" ]]; then
        DOWNLOAD_URL="$PICSUM_URL"
        echo "Mengunduh gambar acak dari internet (Picsum): $DOWNLOAD_URL"
    elif [[ "$IMAGE_SOURCE" == "anime" ]]; then
        check_jq_dependency # Periksa 'jq' sebelum menggunakan
        echo "Mengambil URL gambar anime dari API: $ANIME_API_URL"
        IMAGE_JSON=$(curl -sL "$ANIME_API_URL")
        if [ $? -ne 0 ]; then
            echo "Error: Gagal mengambil data dari API anime." >&2
            exit 1
        fi

        DOWNLOAD_URL=$(echo "$IMAGE_JSON" | jq -r '.url')
        if [ -z "$DOWNLOAD_URL" ] || [[ "$DOWNLOAD_URL" == "null" ]]; then
            echo "Error: Tidak dapat menemukan URL gambar di respons API anime." >&2
            exit 1
        fi
        echo "Mengunduh gambar anime dari: $DOWNLOAD_URL"
    fi

    if [ -z "$DOWNLOAD_URL" ]; then
        echo "Error: URL unduhan tidak ditentukan untuk mode internet." >&2
        exit 1
    fi

    # Lakukan unduhan gambar
    if ! curl -sL -o "$TEMP_IMAGE" "$DOWNLOAD_URL"; then
        echo "Error: Gagal mengunduh gambar dari internet ($IMAGE_SOURCE)." >&2
        rm -f "$TEMP_IMAGE"
        exit 1
    fi

    if [ -f "$TEMP_IMAGE" ]; then
        echo "Mengatur latar belakang dari internet ($IMAGE_SOURCE): $TEMP_IMAGE"
        swaybg -i "$TEMP_IMAGE" -m fill
        rm -f "$TEMP_IMAGE" # Bersihkan file sementara setelah digunakan
    else
        echo "Error: Gambar sementara tidak ditemukan setelah diunduh dari internet ($IMAGE_SOURCE)." >&2
        exit 1
    fi
else
    # Logika gambar lokal yang sudah ada
    # Pastikan direktori ada
    if [ ! -d "$IMAGE_DIR" ]; then
        echo "Error: Direktori gambar tidak ditemukan: $IMAGE_DIR" >&2
        exit 1
    fi

    find "$IMAGE_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" \) | shuf -n 1 | while read -r image; do
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
