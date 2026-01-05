# 🚪 Entrada y Gestión Central de Presencia

Este módulo es el cerebro logístico de la casa. Gestiona quién está en el hogar, la seguridad perimetral de la puerta principal y las rutinas de limpieza automatizada basadas en la ocupación.

## 📋 Automatizaciones Incluidas

### 🌍 Gestión de Presencia (Master)
* **Control de Salida**: Al irse el último miembro del grupo `familia_principal`, se apagan todas las luces, se comprueba el estado del amplificador Denon y se activa el modo de ahorro.
* **Control de Llegada**: Al detectar el regreso de cualquier miembro, se reactiva la casa, se envía una notificación personalizada al móvil y, si el aspirador está trabajando, este vuelve a su base automáticamente.

### 💡 Iluminación de Paso e Inteligente
* **Luz de Entrada Dinámica**: Se enciende por sensor PIR si hay poca luz, pero incluye una **anulación por puerta**: si la puerta principal se abre, la luz se mantiene encendida ignorando el temporizador de 30s.
* **Pasillo Híbrido**: Automatización que activa un relé según la luz exterior. Este sistema convive con **3 PIR mecánicos** tradicionales, permitiendo una fiabilidad total en las zonas de paso sin depender exclusivamente del software.

### 🔔 Seguridad y Avisos
* **Timbre Inteligente**: Integración mediante un Shelly 1 que convierte el timbre convencional en uno inteligente, lanzando avisos por Alexa, altavoces (MP3) y notificaciones push al móvil.
* **Puerta Principal**: Alerta sonora y visual al abrirse la puerta, con notificación de voz específica si el propietario no está en casa.

### 🧹 Limpieza (Sebastián - Vacuum)
* **Gestión de Ausencia**: Inicio automático de limpieza cuando la casa queda vacía, con un aviso previo de 15 minutos por Alexa para retirar obstáculos.
* **Control de Estado**: Notificaciones detalladas de inicio, fin y errores (atascos) con ajuste dinámico del volumen de los altavoces según la estancia.

## 🛠️ Hardware y Requisitos
* **Relés y Timbre**: Shelly 1 para la monitorización del timbre convencional.
* **Detección**: Sensores de contacto Zigbee y PIR mmWave integrados vía **Zigbee2MQTT**.
* **Multimedia**: Archivos MP3 personalizados en `/Media/Notificaciones` (llaman_puerta.mp3, sebastian_limpia.mp3, etc.).
* **Ayudantes (Helpers)**:
    * `input_boolean.presencia_en_casa`: Estado global del hogar.
    * `input_datetime.aspirador`: Programación horaria de limpieza.

---
*Nota: La lógica de la aspiradora ("Sebastián") incluye una gestión avanzada de variables de volumen para restaurar el nivel de los altavoces tras los avisos.*
