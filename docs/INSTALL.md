# Instalasi & Jaringan Awal

1. Install Proxmox VE 8 dari ISO/USB. Beri IP statik management (misal `192.168.10.5/24`), gateway + DNS.
2. Akses `https://IP:8006`, login root.
3. Jalankan `scripts/pve-post-install.sh`, reboot.
4. Datacenter → Node → Network: pastikan `vmbr0` bridge ke NIC fisik.
5. Buat user admin harian (Realm PAM) + aktifkan 2FA (TFA) untuk root.
