# 🛠️ Automatizaciones Varias y Mantenimiento

Este módulo contiene utilidades para la optimización del sistema, monitorización de recursos y triggers alternativos (NFC/Bots) que no pertenecen a una estancia específica pero son esenciales para la salud del servidor.

## 📋 Automatizaciones Incluidas

### 📊 Monitorización y Notificaciones
* **Consumo Mensual**: Notificación automática el último día de cada mes a las 23:59h a través de un **Bot de Telegram**. Informa del gasto energético total acumulado (`sensor.consumo_general_mensual`).
* **Test de Velocidad (Speedtest)**: Forzado manual de actualización de las métricas de red (ping, subida y descarga) mediante un botón en el dashboard, aprovechando la conexión Gigabit de casa.
### 📊 Monitorización y Red a Medida
* **Speedtest Bajo Demanda**: Esta automatización permite realizar tests de velocidad **solo cuando el usuario lo solicita** mediante un botón en el dashboard. 
    * **Optimización**: Para que esto funcione correctamente, se debe **deshabilitar el sondeo de cambios (polling)** en la configuración de la integración de Speedtest en Home Assistant.
    * **Beneficios**: Evita picos de latencia en la red, ahorra ciclos de CPU y garantiza que los datos del sensor solo se actualicen cuando realmente queremos medir el rendimiento.
### 🧹 Mantenimiento del Sistema
* **Purga de Base de Datos**: Ejecución diaria a las 03:30h para limpiar el histórico del registrador (`recorder.purge`). Mantiene un histórico de **30 días** y realiza un compactado (`repack`) para optimizar el almacenamiento en el disco NVMe.
* **Reinicio de HAOS**: Script de seguridad vinculado a un ayudante (`input_boolean.restart`) para reiniciar el core de Home Assistant de forma controlada desde la interfaz.

### 🏷️ Control por Etiquetas (NFC)
* **Apagado Dormitorio vía NFC**: Permite activar la automatización de descanso nocturno simplemente escaneando una etiqueta NFC física ubicada en el dormitorio, facilitando el control sin necesidad de voz o apps.

## 🛠️ Requisitos y Configuración
* **Telegram**: Integración de `notify.telegram_bot_personal` configurada previamente en el archivo `configuration.yaml`.
* **Sensores de Red**: Integración de Speedtest instalada.
* **Tags**: Etiquetas NFC físicas vinculadas mediante la App móvil de Home Assistant.
* **Ayudantes (Helpers)**:
    * `input_boolean.restart`: Para el reinicio del sistema.
    * `input_button.speed_test`: Para el disparo del test de red.
    * `sensor.ultimo_dia_del_mes`: Sensor template necesario para la lógica del aviso de consumo.

---
*Nota: Estas automatizaciones garantizan que el servidor Proxmox y la instancia de HAOS funcionen de manera fluida y sin degradación de rendimiento por el tamaño de la base de datos.*
