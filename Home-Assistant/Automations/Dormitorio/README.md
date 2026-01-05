# 🛌 Dormitorio y Baño Principal

Este conjunto de automatizaciones está diseñado para mejorar el descanso, automatizar la climatización y facilitar las rutinas de mañana y noche utilizando sensores de presencia, temperatura y servicios de voz.

## 📋 Automatizaciones Incluidas

### 🌅 Rutinas de Despertar y Descanso
* **Despertador Inteligente**: Amanecer simulado con luces, saludo personalizado según el día de la semana y resumen de eventos de los calendarios personales y familiares.
* **Apagado Progresivo**: Aviso por voz 30 minutos antes del apagado total de luces y televisión para fomentar la higiene del sueño.

### 🌡️ Confort Climático
* **Calefacción Automática**: Control del enchufe inteligente del radiador basado en umbrales de temperatura (18°C - 19°C) durante la noche.
* **Aviso de Temperatura Óptima**: Notificación sonora cuando el baño alcanza la temperatura ideal para su uso.

### 💡 Iluminación y Control
* **Baño Nocturno**: Encendido de luz en color azul tenue al detectar movimiento durante la noche, evitando deslumbramientos.
* **Dormitorio Entrada**: Iluminación automática por sensor PIR si la luz ambiental es baja.
* **Pulsador Multifunción**: Control centralizado de lámparas, luces de techo y TV mediante clics simples, dobles o prolongados (vía MQTT).

### 📱 Gestión de Dispositivos
* **Carga Inteligente USB**: Control del ciclo de carga del móvil durante la noche para proteger la salud de la batería.

## 🛠️ Requisitos y Hardware
* **Sensores de Ambiente**: Sensores de temperatura y humedad Zigbee (`sensor.bano_temperature`, `sensor.dormitorio_temperature`).
* **Detección**: Sensores de movimiento PIR y ocupación integrados mediante **Zigbee2MQTT**.
* **Voz y Audio**: 
    * **Google Cloud TTS** (Wavenet-E) para mensajes relajantes.
    * **Home Assistant Cloud** (VeraNeural) para el despertador.
* **Ayudantes (Helpers)**:
    * `input_datetime.despertador_hora`: Para fijar la alarma.
    * `input_datetime.apagado_dormitorio`: Para el inicio de la rutina de noche.

---
*Nota: Los avisos sonoros de temperatura utilizan los archivos alojados en la carpeta raíz [`/Media/Notificaciones`](../../Media/Notificaciones).*
