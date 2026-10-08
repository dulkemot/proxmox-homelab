# Storage NAS (NFS/CIFS)

Datacenter → Storage → Add:

- **NFS** (TrueNAS/Synology): ID `nas-backup`, Server IP NAS, Export `/volume1/proxmox`, Content: `VZDump backup` (+ `ISO image` bila perlu).
- **CIFS/SMB**: ID sama, share `//IP/proxmox`, username + password.

Cek dari shell node:
```bash
pvesm status          # storage harus Active
ls /mnt/pve/nas-backup/dump
```
