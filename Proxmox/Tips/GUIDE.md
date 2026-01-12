# 📝 Proxmox GUIDE - Comandos y Atajos Útiles

Este documento recopila **atajos, comandos y tips rápidos** para gestionar Proxmox, contenedores LXC y VMs de forma eficiente. Ideal como referencia rápida para administradores de homelabs.

---

## ⚡ Gestión del Nodo (Host)

* **Reiniciar nodo:** `reboot`
* **Apagar nodo:** `shutdown -h now`
* **Ver estado de los servicios de Proxmox:** ```bash
  systemctl status pveproxy pvedaemon ```
* **Reiniciar la interfaz web (si se queda colgada):** `systemctl restart pveproxy`
* **Actualizar todo el sistema Proxmox por terminal:**
  Es la forma más segura de actualizar
```bash
apt update && apt full-upgrade -y
```
* **Ver la Temperatura:** `sensors`
  Si no tienes instalado "sensors" puedes instalarlo con: `apt install lm-sensors`
* **Passthrough de GPU**
Comando rápido para permisos de GPU en LXC: `chown -R root:video /dev/dri && chmod -R 777 /dev/dri`
(Esto ayuda mucho cuando Jellyfin no reconoce el hardware para acelerar video)
  
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
## 💾 Montaje Permanente de Discos (fstab)

Para asegurar que tus discos (HDDs adicionales o USBs) se monten automáticamente al reiniciar el servidor.

### 1. Identificar el UUID del disco
Nunca uses `/dev/sdb1` en el fstab, ya que puede cambiar. Usa el **UUID**:
```bash
blkid
```
### 2. Crear el punto de montaje
```bash
mkdir -p /mnt/nombre_disco
```
### 3. Editar el archivo fstab
> [!CAUTION]
> ⚠️ **¡PELIGRO!** Un error de sintaxis en este archivo puede impedir que Proxmox arranque (se quedará en modo emergencia). Asegúrate siempre de tener el UUID correcto antes de guardar.

```bash
nano /etc/fstab
```
**Añade la línea al final siguiendo este esquema (ejemplo para ext4):**
```bash
UUID=tu-uuid-aqui /mnt/nombre_disco ext4 defaults 0 2
```
**Nota para discos USB:** 
Si el disco puede estar desconectado a veces, añade nofail para que el sistema arranque igual
```bash
UUID=tu-uuid-aqui /mnt/nombre_disco ext4 defaults,nofail 0 2
```
### 4. Recargar y Montar sin reiniciar
Para aplicar los cambios sin reiniciar el servidor:

```bash
systemctl daemon-reload
mount -a
```
### 💡 Un truco extra de seguridad

Si quieres estar **100% seguro** de que no has roto nada antes de reiniciar el servidor, puedes ejecutar este comando después de editar el `fstab`:

- **Verificar errores en fstab:**
  ```bash
  findmnt --verify
  ```
  **IMPORTANTE Si este comando te da algún error en rojo, no reinicies el servidor. Corrige el archivo primero; de lo contrario, el sistema podría no arrancar y entrar en modo de emergencia.**

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
