#!/system/bin/sh
MODDIR=${0%/*}

# Skrip berjalan di background untuk mengecek waktu setiap menit
while true; do
    # Mengambil jam dan menit saat ini (format 24 jam, misal: 00:00, 23:59)
    CURRENT_TIME=$(date +"%H:%M")

    # Cek apakah sudah pukul 12.00 malam (00:00)
    if [ "$CURRENT_TIME" = "00:00" ]; then
        # Perintah untuk melakukan reboot perangkat
        reboot
        exit 0
    fi

    # Jeda selama 30 detik sebelum mengecek ulang waktu
    sleep 30
done
