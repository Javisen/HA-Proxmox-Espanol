# 🍳 Cocina y Galería

En esta carpeta se encuentran las automatizaciones base para la gestión de la iluminación inteligente y la seguridad de los electrodomésticos en la zona de cocina.

## 📋 Automatizaciones Incluidas en esta Carpeta

### 1. Iluminación Reforzada (Presencia + PIR)
Lógica avanzada de iluminación que combina dos tecnologías para evitar apagados accidentales:
* **Encendido**: Se activa si la luminosidad es inferior a **600 lux** y se detecta movimiento (PIR) o presencia (mmWave).
* **Apagado**: Solo se ejecuta cuando **ambos** sensores (PIR y Presencia) reportan "off" durante un tiempo de gracia, asegurando que no haya nadie aunque esté quieto cocinando.

### 2. Seguridad del Congelador
* **Aviso de Puerta Abierta**: Si el sensor de contacto detecta que la puerta lleva abierta más de 90 segundos, lanza un aviso sonoro.
* **Notificación Dual**: Reproduce el archivo `congelador_abierto.mp3` en los altavoces del salón/dormitorio y envía un mensaje de voz a través de Alexa.

## 🛠️ Hardware y Requisitos
* **Conectividad**: Todos los sensores operan bajo **Zigbee2MQTT**.
* **Sensores**: 
    * Sensor de presencia mmWave (`presencia_cocina_occupancy`).
    * Sensor PIR de movimiento (`pir_cocina_occupancy`).
    * Sensor de luminosidad (`sensor_iluminacion_illuminance`).
    * Sensor de contacto magnético (`binary_sensor.puerta_congelador_contact`).
* **Multimedia**: Los audios se encuentran en la carpeta raíz [`/Media/Notificaciones`](../../Media/Notificaciones).

---
*Para ver la gestión avanzada de la colada, consulta la subcarpeta [Lavadora](./Lavadora).*


