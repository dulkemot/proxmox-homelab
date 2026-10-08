# Strategi Backup 3-2-1 Versi Rumahan

- **3 copy**: VM jalan + backup di NAS + copy mingguan di USB eksternal.
- **2 media**: disk NAS + USB.
- **1 offsite**: copy bulanan ke cloud (rclone ke Drive/S3) untuk config penting.

Jadwal via Datacenter → Backup → Add (atau cron ke `scripts/vzdump-to-nas.sh`):
- Harian 02:00: semua CT + VM ringan (snapshot, zstd).
- Mingguan: VM berat (NVR/CCTV) 1x, simpan 4 copy.

Uji restore 1x sebulan ke VMID dummy — backup yang tak pernah dites = bukan backup.
