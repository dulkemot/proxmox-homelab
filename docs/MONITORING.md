# Monitoring Host & VM

- **Zabbix agent** di tiap VM penting → trigger CPU/RAM/disk + notif Telegram.
- **Node Exporter** (lihat repo `docker-selfhosted-stack`) → grafik Grafana per host.
- **Grafik bawaan**: Datacenter → pantau grafik dasar per node/VM — cukup untuk cek cepat.
- Alert minimum: disk > 85%, backup gagal, node unreachable (via Uptime Kuma).
