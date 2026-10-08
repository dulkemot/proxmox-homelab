#!/usr/bin/env bash
# vzdump-to-nas.sh — backup semua VM/CT ke storage NAS + hapus backup lama.
# Pemakaian:  STORAGE=nas-backup RETENTION=7 bash vzdump-to-nas.sh
# Isi BOT_TOKEN/CHAT_ID untuk notifikasi Telegram (opsional, kosongkan bila tidak perlu).
set -euo pipefail

STORAGE="${STORAGE:-nas-backup}"
RETENTION="${RETENTION:-7}"
BOT_TOKEN="${BOT_TOKEN:-}"
CHAT_ID="${CHAT_ID:-}"

notify() {
  if [ -n "$BOT_TOKEN" ] && [ -n "$CHAT_ID" ]; then
    curl -s "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
      -d "chat_id=${CHAT_ID}&text=$1" > /dev/null || true
  fi
}

echo "==> Backup semua VM/CT ke storage: $STORAGE"
vzdump --all 1 --storage "$STORAGE" --mode snapshot --compress zstd

echo "==> Hapus backup lebih tua dari $RETENTION hari..."
find "/mnt/pve/$STORAGE/dump" -name "vzdump-*" -mtime +"$RETENTION" -delete || true

notify "Backup Proxmox selesai ($(hostname))."
echo "==> Selesai."
