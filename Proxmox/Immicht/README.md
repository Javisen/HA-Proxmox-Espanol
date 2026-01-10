# 📸 Configuración de Immich en Proxmox

Este repositorio contiene la configuración para desplegar **Immich** en un LXC con Docker. Immich es una solución de gestión de fotos y vídeos de alto rendimiento.

## 📂 Estructura de Archivos
* `/immicht-aplication/docker-compose.yml`: Configuración de servicios.
* `script_lxc.sh`: Script para la creación automatizada del contenedor LXC en Proxmox.
* `mount_disk.md`: Instrucciones para añadir discos externos al LXC.

## 🚀 Despliegue

1. **Crear el LXC:** Ejecuta el script de creación en la consola de Proxmox.
2. **Montar el disco:** Asegúrate de que el disco de datos esté montado en el host y pasado al LXC editando el archivo `/etc/pve/lxc/ID_LXC.conf` añadiendo la línea (ejemplo):
   `mp0: /mnt/pve/disco_fotos,mp=/media/Fotos`
3. **Configurar el Docker:** Edita el `docker-compose.yml` para mapear las rutas de tus fotos.

## 🔄 Migración y Backup con RSYNC
Para usuarios que aún están utilizando la configuración original dentro de la carpeta de la aplicación, utilicen estos comandos para migrar las fotos hacia el disco externo y poder importarlas a la nueva configuracion: (repetir tantas veces como usuarios tengas)

```
# Copiar fotos de la librería original de Immich hacia el disco externo (Usuario 1)
rsync -avP /Immicht-aplication/Immich_Uploads/library/usuario1/ /media/Fotos/usuario1/

# Copiar fotos de la librería original de Immich hacia el disco externo (Usuario 2)
rsync -avP /Immicht-aplication/Immich_Uploads/library/usuario2/ /media/Fotos/usuario2/
```
## 🖼️ Extracción Masiva de Imágenes (Limpieza)
Comando para extraer todas las fotos (.jpg, .jpeg, .png, etc.) de los directorios por defecto que crea Immich para unificarlas en una sola carpeta raíz:
```
find /ruta/origen/ -type f -iregex ".*\.\(jpg\|jpeg\|png\|gif\)" -exec mv -t /ruta/destino_unificado/ {} +
```

**Una vez ya tenemos la copia de las fotos en nuestro nuevo disco, hemos puesto todas las fotos en una sola carpeta y a salvo, ya podemos trabajar con seguridad con la configuracion del docker**

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
### 📄 Configuración del archivo .env
Crea el archivo en `/immicht-aplication/.env` con el siguiente contenido:

```env
# RUTA DONDE SE GUARDARÁN LAS NUEVAS SUBIDAS
UPLOAD_LOCATION=/media/Fotos/Immich_Uploads

# DATOS DE LA BASE DE DATOS (Internos)
DB_PASSWORD=postgres
DB_USERNAME=postgres
DB_DATABASE_NAME=immich

# DONDE SE GUARDA LA BASE DE DATOS 
DB_DATA_LOCATION=./postgres_data

# VERSIÓN
IMMICH_VERSION=release
```
