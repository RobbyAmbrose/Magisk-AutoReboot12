# 🔄 Magisk Auto Reboot
> Modul Magisk ringan untuk menjadwalkan *reboot* (mulai ulang) otomatis perangkat Android setiap pukul 12 malam (`00:00`).

---

## 📌 Tentang Modul
Modul ini dirancang untuk berjalan di latar belakang menggunakan skrip layanan bawaan Magisk (`service.sh`). Skrip ini secara berkala memeriksa waktu sistem dan memicu perintah *reboot* begitu jarum jam menunjukkan pukul 00:00. Sangat cocok bagi Anda yang ingin menyegarkan sistem atau membersihkan cache memori secara otomatis setiap hari.

## ✨ Fitur Utama
* **Ringan & Efisien:** Menggunakan skrip shell dasar tanpa memerlukan aplikasi tambahan pihak ketiga yang membebani RAM.
* **Background Daemon:** Berjalan secara otomatis melalui mekanisme `service.sh` Magisk saat perangkat menyala.
* **Kompatibilitas Luas:** Mendukung berbagai versi Magisk, KernelSU, dan APatch (yang mendukung struktur modul standar).
* **Aman untuk Baterai:** Menggunakan jeda waktu (*sleep interval*) yang optimal sehingga tidak menguras daya baterai.

## 📥 Cara Instalasi
1. Unduh file `.zip` modul dari halaman **[Releases](../../releases)** repository ini.
2. Buka aplikasi **Magisk** (atau KernelSU / APatch) di perangkat Anda.
3. Masuk ke menu **Modules** (Modul).
4. Ketuk tombol **Install from storage** (Instal dari penyimpanan) di bagian atas.
5. Pilih file `.zip` modul yang sudah diunduh.
6. Tunggu proses flashing selesai, lalu ketuk **Reboot** untuk memulai ulang perangkat.

## 🛠️ Cara Kerja Skrip (`service.sh`)
Skrip berjalan secara terus-menerus di latar belakang dengan pengecekan waktu setiap 30 detik:
```sh
while true; do
    CURRENT_TIME=$(date +"%H:%M")
    if [ "$CURRENT_TIME" = "00:00" ]; then
        reboot
        exit 0
    fi
    sleep 30
done
