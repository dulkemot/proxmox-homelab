# Template Cloud-Init (VM 30 detik)

1. Download image: CT Templates → Templates → `debian-12-generic` (untuk LXC) atau ISO Debian netinst (untuk VM).
2. Untuk VM: buat VM → pasang ISO → OS type Linux → tab **Cloud-Init**: isi user, SSH key, IP DHCP/statik.
3. Klik kanan VM → **Convert to template**. Clone dari template untuk tiap layanan baru.
4. LXC cukup untuk: reverse proxy, monitoring, web ringan. VM penuh untuk: Docker host, NVR.
