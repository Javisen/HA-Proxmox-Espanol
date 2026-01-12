# 📝 Proxmox GUIDE - Comandos y Atajos Útiles

Este documento recopila **atajos, comandos y tips rápidos** para gestionar Proxmox, contenedores LXC y VMs de forma eficiente. Ideal como referencia rápida para administradores de homelabs.

---

## ⚡ Gestión del Nodo (Host)

* **Reiniciar nodo:** `reboot`
* **Apagar nodo:** `shutdown -h now`
* **Ver estado de los servicios de Proxmox:** ```bash
  systemctl status pveproxy pvedaemon ```
* **Reiniciar la interfaz web (si se queda colgada):** `systemctl restart pveproxy`

---

## 📦 Gestión de Contenedores (LXC)
*Sustituye `ID` por el número del contenedor (ej. 105).*

* **Iniciar un contenedor:** `pct start ID`
* **Detener un contenedor:** `pct stop ID`
* **Reiniciar un contenedor:** `pct reboot ID`
* **Entrar en la consola de un LXC:** `pct enter ID`
* **Ver configuración de un LXC:** `pct config ID`
* **Reparar sistema de archivos (fsck):** > **Nota:** El LXC debe estar apagado.
  ```bash
  pct fsck ID
  ```
* **Desbloquear un LXC (si se queda en modo "locked"):** `pct unlock ID`

---

## 🖥️ Gestión de Máquinas Virtuales (VM)
*Sustituye `ID` por el número de la VM (ej. 100).*

* **Iniciar VM:** `qm start ID`
* **Apagar VM (ordenado):** `qm shutdown ID`
* **Forzar apagado (tirar del cable):** `qm stop ID`
* **Listar todas las VMs y su estado:** `qm list`

---

## 💾 Discos y Almacenamiento

* **Ver uso de disco de todo el sistema:** `df -h`
* **Listar dispositivos de bloque (identificar USBs/Discos):** `lsblk`
* **Ver estado de salud de discos físicos (SMART):** ```bash smartctl -a /dev/sdX ```
  
  smartctl -a /dev/sdX
