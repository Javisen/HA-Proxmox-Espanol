# 🏠 HA-Proxmox-Espanol

¡Bienvenido! En este repositorio comparto la configuración detallada y las automatizaciones de mi ecosistema de hogar inteligente, centrado en la virtualización y el alto rendimiento.

---

## 🚀 El Corazón del Sistema: Servidor Proxmox
Toda la inteligencia de la casa corre sobre un nodo de Proxmox Virtual Environment 9.1.4, optimizado para bajo consumo y alta disponibilidad.

* **Hardware**: HP ELITEDESK 800 G2 DM (35W).
* **CPU**: Intel Core i7-6500T.
* **Memoria**: 32 GB DDR4.
* **Almacenamiento**: 1 TB NVME M.2 (Sistema y VMs) + 5 HDs adicionales para datos.
* **Instancias**: VM con Home Assistant OS (HAOS), varios LXC (Jellyfin, AdGuard, Wireguard, MailCow, etc.).

---

## 🤖 Home Assistant (HAOS)
Mi instancia de HAOS está configurada para gestionar desde la iluminación hasta el mantenimiento del servidor.

* **Conectividad**: Red Gigabit y dominio propio para acceso exterior seguro.
* **Integraciones Clave**: Zigbee2MQTT, Google Cloud TTS, Alexa Media Player y Telegram Bot.
* **[Explorar Automatizaciones](./Home-Assistant/Automations)**:
    * 🍳 **Cocina-Galería**: Gestión de presencia avanzada y electrodomésticos.
    * 🛌 **Dormitorio/Baño**: Rutinas de despertar, climatización y confort nocturno.
    * 🚪 **Entrada**: Control de presencia centralizado, timbre inteligente y limpieza con "Sebastián".
    * 🛠️ **Varias**: Mantenimiento de DB, Speedtest bajo demanda y avisos de consumo.

---

## 🎶 Ecosistema de Audio HiFi (Audiophile)
Una parte fundamental de mi setup es el sistema de audio distribuido y de alta fidelidad gestionado desde un nodo dedicado.

* **Servidor**: Dell Optiplex 3050 (i3-6100T, 8GB DDR4) corriendo **Volumio Free**.
* **DAC**: FiiO BR13 conectado por USB.
* **Amplificador**: DENON DRA-275RD.
* **Altavoces**: VIETA E-500 (Vintage de 3 vías) con tweeters mejorados **Visaton SC 10N**.

---

## 📂 Estructura del Repositorio
* [`/Home-Assistant`](./Home-Assistant): Configuración, YAMLs y lógica de HAOS.
* [`/Media/Notificaciones`](./Media/Notificaciones): Archivos de audio personalizados para avisos del hogar.
* `.gitignore`: Filtro de seguridad para evitar subir datos sensibles.

---

> [!NOTE]
> **Estado del Proyecto**: 🚧 En desarrollo activo.
> Este repositorio es una base de ejemplo real. Siéntete libre de explorar el código para inspirarte en tus propias automatizaciones.
