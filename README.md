# Proxmox Homelab Guide 🇮🇩

Catatan operasional Proxmox VE untuk server kecil: instalasi, storage NAS, strategi backup, template cloud-init, dan monitoring. Dipakai untuk lab + server produksi ringan (CCTV NVR, web klien, monitoring).

![Proxmox](https://img.shields.io/badge/Proxmox_VE-8.x-e57000?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)

## Isi

```
scripts/
  pve-post-install.sh     # repo no-subscription + update + tools dasar
  vzdump-to-nas.sh        # backup semua VM/CT ke NAS + retensi + notif Telegram
docs/
  INSTALL.md              # instalasi & jaringan awal
  STORAGE-NAS.md          # NFS/CIFS ke NAS (Synology/TrueNAS/RPi)
  BACKUP-STRATEGY.md      # jadwal 3-2-1 versi rumahan
  CLOUD-INIT.md           # template VM Debian/Ubuntu 30 detik
  MONITORING.md           # Zabbix agent + Grafana untuk host & VM
```

## Mulai cepat

```bash
# di node Proxmox (root)
bash pve-post-install.sh

# backup malam ini ke storage NAS bernama "nas-backup"
STORAGE=nas-backup RETENTION=7 bash vzdump-to-nas.sh
```

Isi variabel Telegram di dalam script bila mau notifikasi (`BOT_TOKEN`, `CHAT_ID`).

## Prinsip backup di sini

- **Snapshot mode** untuk VM produksi (minim downtime).
- **Stop mode** hanya untuk VM yang boleh mati sebentar.
- Retensi lokal 7 hari + 1 copy mingguan di USB/NAS kedua.

MIT — dulkemot 2026
