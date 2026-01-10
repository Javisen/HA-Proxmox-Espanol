# 📸 Configuración de Immich en Proxmox

Este repositorio contiene la configuración para desplegar **Immich** en un LXC con Docker. Immich es una solución de gestión de fotos y vídeos de alto rendimiento.

## 📂 Estructura de Archivos
* `/immicht-aplication/docker-compose.yml`: Configuración de servicios.
* `script_lxc.sh`: Script para la creación automatizada del contenedor LXC en Proxmox.
* `mount_disk.md`: Instrucciones para añadir discos externos al LXC.

## 🚀 Despliegue

1. **Crear el LXC:** Ejecuta el script de creación en la consola de Proxmox.
2. **Montar el disco:** Asegúrate de que el disco de datos esté montado en el host y pasado al LXC (Mount Point).
3. **Configurar el Docker:** Edita el `docker-compose.yml` para mapear las rutas de tus fotos.

### 💾 Configuración de Volúmenes (docker-compose.yml)
Asegúrate de configurar los puntos de montaje según tu estructura:

```yaml
    volumes:
      # Ubicación para fotos NUEVAS (Configurado en .env)
      - ${UPLOAD_LOCATION}:/usr/src/app/upload
      - /etc/localtime:/etc/localtime:ro
      
      # Bibliotecas externas (Solo lectura)
      - /media/Fotos/usuario1:/mnt/fotos_usuario1:ro
      - /media/Fotos/usuario2:/mnt/fotos_usuario2:ro

```
