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
* **Limpiar dispositivos "loop" (Soluciona errores de backup):**
  Útil cuando recibes el error "can't read superblock" en backups manuales o programados.
```bash
   losetup -D
```
---

## 🔄 Backups (vzdump)

* **Lanzar backup manual de un LXC:**
  ```bash
  vzdump ID --storage nombre_almacenamiento --compress zstd
  ```
* **Listar procesos de backup en ejecución:**
  Útil para verificar si un backup se ha quedado colgado o para ver el progreso real desde la consola.
  ```bash
  ps aux | grep vzdump
  ```
* **Cancelar un proceso de backup manualmente:**
  Si un backup se queda bloqueado y no puedes pararlo desde la interfaz web, identifica el PID con el comando anterior y usa:
  ```bash
  kill -9 PID
  ```

---
## 🌐 Red y Conectividad

* **Ver IPs asignadas al host Proxmox:** `ip a`
* **Editar configuración de red (Puentes, IPs fijas):** > **¡Cuidado!** Un error aquí puede dejarte sin acceso local al servidor.
  ```bash
  nano /etc/network/interfaces
  ```
* **Probar si un puerto está abierto (útil para Túneles Cloudflare o servicios externos):**
  ```bash
  nc -zv IP_DESTINO PUERTO
  ```
* **Monitorizar tráfico de red en tiempo real:**
  ```bash
  nload
  ```
  *(Si no está instalado, puedes ponerlo con `apt install nload`)*
