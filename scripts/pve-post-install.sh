#!/usr/bin/env bash
# pve-post-install.sh — dijalankan sekali sebagai root setelah install Proxmox VE 8.
# - Nonaktifkan repo enterprise (butuh lisensi), pakai no-subscription
# - Update sistem + install tools dasar
set -euo pipefail

echo "==> Matikan repo enterprise..."
sed -i 's/^deb/#deb/' /etc/apt/sources.list.d/pve-enterprise.list || true

echo "==> Tambah repo no-subscription..."
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" \
  > /etc/apt/sources.list.d/pve-no-subscription.list

echo "==> Update & upgrade..."
apt update
apt full-upgrade -y

echo "==> Tools dasar..."
apt install -y sudo curl htop iftop iotop lm-sensors git vim

echo "==> Selesai. Reboot disarankan: reboot"
