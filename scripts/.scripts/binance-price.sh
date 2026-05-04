#!/bin/bash

# Konfigurasi Simbol (Contoh: BTCUSDT)
SYMBOL="BTCUSDT"

# Endpoint Binance Futures
URL="https://fapi.binance.com/fapi/v1/ticker/price?symbol=${SYMBOL}"

# Mengambil data menggunakan curl
# Menggunakan 'jq' untuk merapikan output (pastikan jq sudah terinstall)
RESPONSE=$(curl -s "$URL")

# Ekstraksi harga dari JSON
echo $RESPONSE
PRICE=$(echo $RESPONSE | jq -r '.price')

# Cek apakah data berhasil diambil
if [ "$PRICE" != "null" ]; then
    echo "Harga sekarang untuk $SYMBOL: $PRICE"
else
    echo "Error: Simbol tidak ditemukan atau masalah koneksi."
    echo "Response: $RESPONSE"
fi
