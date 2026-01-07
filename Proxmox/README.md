# 🏢 Infraestructura de Servidores: Proxmox VE

Este directorio documenta la configuración del hipervisor central que gestiona todos los servicios de la vivienda, garantizando alta disponibilidad y aislamiento de procesos.

## ⚙️ Hardware: HP EliteDesk 800 G2 DM (35W)
* **CPU:** Intel Core i7-6700T @ 3.60 GHz (4 Cores).
* **RAM:** 32 GB DDR4.
* **Storage:** 1 TB NVME M.2 (Sistema y almacenamiento principal).
* **Ampliación:** 5 HDs dedicados para almacenamiento masivo (Jellyfin/Backups).

## 📦 Ecosistema de Servicios (VMs & LXC)

La infraestructura está diseñada para ser modular, ejecutando cada servicio en contenedores aislados para maximizar la estabilidad y el aprovechamiento del hardware i5-6500T.

### 🏠 Gestión del Hogar y Dashboard
* **HAOS (VM):** Core del sistema domótico. Gestiona todas las integraciones y automatizaciones.
* **Homarr:** Centro de control unificado donde se visualizan todos los servicios y el estado de la red.

### 🛡️ Red y Seguridad
* **AdGuard Home:** Servidor DNS para bloqueo de publicidad y rastreadores en toda la red local.
* **Wireguard:** VPN de alto rendimiento para acceso seguro desde el exterior.
* **Cloudflared:** Túnel seguro para la exposición de servicios bajo dominio propio.
* **Vaultwarden:** Servidor de gestión de contraseñas (Bitwarden) autoalojado.

### 🎬 Multimedia y Ocio (Suite Arr)
* **Jellyfin:** Servidor principal de medios para streaming local y remoto.
* **Navidrome:** Servidor de streaming de música de alta fidelidad.
* **Sonarr / Radarr / Prowlarr:** Automatización de búsqueda y gestión de bibliotecas de video.
* **Transmission / Metube:** Motores de descarga para diversos contenidos multimedia.

### 📊 Utilidades y Herramientas
* **Immich:** Solución de backup y gestión de fotos personales (alternativa a Google Photos).
* **Mailcow:** Suite completa de servidor de correo electrónico.
* **Stirling-PDF:** Herramientas locales para edición y gestión de documentos PDF.
* **MySpeed:** Monitorización automatizada de la velocidad de la conexión a internet.
* **Glances:** Monitorización en tiempo real de los recursos de hardware del nodo Proxmox.

## 🌐 Red y Acceso
* **Lan:** Gigabit Ethernet.
* **Acceso Exterior:** Gestión mediante dominio propio con SSL para servicios críticos.
