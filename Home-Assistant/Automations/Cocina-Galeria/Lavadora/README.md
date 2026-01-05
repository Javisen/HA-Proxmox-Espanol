# 🧺 Gestión Inteligente de Lavadora

Este bloque de automatizaciones permite monitorizar el ciclo de lavado mediante el consumo eléctrico y recibir avisos sonoros. Además, incluye un sistema de recordatorio recurrente que detecta si la ropa sigue dentro una vez finalizado el ciclo.

## 🛠️ Requisitos Previos

Para que estos archivos funcionen, necesitas tener configurados los siguientes dispositivos e integraciones:

1.  **Sensor de Potencia**: Un enchufe inteligente o medidor que devuelva la potencia en vatios (`sensor.lavadora_potencia`).
2.  **Sensor de Contacto**: Un sensor magnético Zigbee/Shelly en la puerta de la lavadora (`binary_sensor.puerta_lavadora_contact`).
3.  **Reproductores de Audio**: Altavoces inteligentes o Media Players (Google Home, Alexa o sistemas basados en MPD como Volumio).
4.  **Archivos de Audio**: Debes tener los archivos `.mp3` en la carpeta `/config/www/notificaciones/nuevas/` para que sean accesibles vía `/local/`.

## 🧠 Ayudantes (Helpers) Necesarios

Debes crear el siguiente ayudante desde la interfaz de Home Assistant (Ajustes > Dispositivos y servicios > Ayudantes):

* **Tipo**: Desplegable (input_select)
* **Nombre**: `estado_de_lavado`
* **Opciones**:
    * `Apagada`
    * `Lavando`
    * `Terminado`

## 📋 Automatizaciones Incluidas

### 1. Gestión y Avisos de Audio
* **Inicio**: Se activa cuando el consumo supera los 5W durante 3 minutos. Cambia el estado a `Lavando` y anuncia el inicio.
* **Fin**: Se activa cuando el consumo baja de 5W durante 3 minutos. Solo se dispara si el estado previo era `Lavando`.
* **Reset**: Si se abre la puerta en cualquier momento, el estado vuelve a `Apagada`.

### 2. Recordatorio de Puerta Cerrada
* Lanza un aviso sonoro cada 5 minutos si el ciclo ha terminado pero la puerta sigue cerrada. Se detiene automáticamente en cuanto sacas la ropa (abres la puerta).

---
*Nota: Asegúrate de ajustar las entidades de los `media_player` a los nombres de tus propios altavoces.*
