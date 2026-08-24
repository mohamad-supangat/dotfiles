#!/bin/bash

# ==============================================================================
# Remove Background Mockup via Clipboard / File (ImageMagick v7 Fix)
# ==============================================================================

# 1. Cek ImageMagick
if command -v magick &>/dev/null; then
  CMD="magick"
elif command -v convert &>/dev/null; then
  CMD="convert"
else
  echo "Error: ImageMagick belum terinstall."
  exit 1
fi

# 2. Cek Tool Clipboard (Wayland atau X11)
if [ "$XDG_SESSION_TYPE" = "wayland" ] && command -v wl-paste &>/dev/null; then
  CLIP_READ="wl-paste -t image/png"
  CLIP_WRITE="wl-copy -t image/png"
elif command -v xclip &>/dev/null; then
  CLIP_READ="xclip -selection clipboard -t image/png -o"
  CLIP_WRITE="xclip -selection clipboard -t image/png -i"
else
  echo "Error: xclip atau wl-clipboard tidak ditemukan!"
  exit 1
fi

TEMP_INPUT="/tmp/mockup_temp_in.png"
TEMP_OUTPUT="/tmp/mockup_temp_out.png"
FUZZ="5%"

# 3. Logika Penentuan Input
if [ -n "$1" ] && [ -f "$1" ]; then
  echo "Menggunakan file input: $1"
  INPUT_SRC="$1"
  FUZZ="${2:-5%}"
else
  echo "Mengambil gambar dari Clipboard..."
  $CLIP_READ >"$TEMP_INPUT" 2>/dev/null

  if [ ! -s "$TEMP_INPUT" ]; then
    echo "Error: Tidak ada gambar di clipboard!"
    echo "Petunjuk: Salin (Copy) dulu gambar screenshot Anda ke clipboard."
    exit 1
  fi
  INPUT_SRC="$TEMP_INPUT"
  FUZZ="${1:-5%}"
fi

# 4. Ambil Dimensi Gambar
WIDTH=$($CMD identify -format "%w" "$INPUT_SRC")
HEIGHT=$($CMD identify -format "%h" "$INPUT_SRC")
MAX_X=$((WIDTH - 1))
MAX_Y=$((HEIGHT - 1))

echo "Memproses remove background (Fuzz: $FUZZ)..."

# 5. Floodfill dengan Sintaks Kompatibel ImageMagick v7
# Kita mengganti '-draw floodfill' menjadi '-draw color X,Y floodfill'
$CMD "$INPUT_SRC" \
  -alpha set \
  -fuzz "$FUZZ" \
  -fill "rgba(0,0,0,0)" \
  -draw "color 0,0 floodfill" \
  -draw "color ${MAX_X},0 floodfill" \
  -draw "color 0,${MAX_Y} floodfill" \
  -draw "color ${MAX_X},${MAX_Y} floodfill" \
  "$TEMP_OUTPUT"

# 6. Salin Hasil Kembali ke Clipboard
if [ -f "$TEMP_OUTPUT" ]; then
  cat "$TEMP_OUTPUT" | $CLIP_WRITE
  echo "Selesai! Hasil gambar tanpa background telah disalin ke CLIPBOARD."

  OUTPUT_FILE="result-nobg.png"
  cp "$TEMP_OUTPUT" "$OUTPUT_FILE"
  echo "File juga disimpan sebagai: $OUTPUT_FILE"

  rm -f "$TEMP_INPUT"
else
  echo "Gagal memproses gambar."
fi
