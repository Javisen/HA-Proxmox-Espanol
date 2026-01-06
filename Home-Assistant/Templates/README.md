# 🧠 Sensores de Plantilla (Templates)

En esta sección se encuentran los archivos de configuración que definen sensores virtuales basados en lógica **Jinja2**. Estos sensores procesan datos de múltiples fuentes para ofrecer información masticada, estados traducidos o cálculos complejos en tiempo real.

## 📁 Estructura de la Sección

### 🌦️ Meteorología y Previsión (`meteorologia.yaml` / `prevision.yaml`)
* **Traducción de Estados**: Convierte condiciones climáticas de servicios externos (OpenWeatherMap/AEMET) al castellano natural (ej: "Partialmente nublado" en lugar de `partlycloudy`).
* **Sensación Térmica Calculada**: Sensor avanzado que aplica fórmulas de presión de vapor de agua y velocidad del viento para obtener una sensación real precisa.
* **Previsión a 24h**: Automatización integrada que extrae la temperatura máxima, mínima y probabilidad de lluvia de AEMET para el día siguiente.

### 📅 Tiempo y Saludos (`meteorologia.yaml` / `saludos_aleatorios.yaml`)
* **Hora Natural**: Convierte la hora digital en lenguaje humano (ej: "Son las cinco y cuarto de la tarde").
* **Calendario Inteligente**: Sensor que analiza el próximo evento del calendario familiar, calculando la duración y formateando la fecha de inicio de forma amigable.
* **Saludos Dinámicos**: Genera un saludo aleatorio basado en el momento del día (mañana, tarde o noche) y el idioma (castellano/valenciano/francés).

### 🔢 Contadores y Estado Global (`contadores.yaml` / `luces_encendidas.yaml`)
* **Métricas de Sistema**: Contadores automáticos que monitorizan el volumen de tu configuración: luces totales, scripts, automatizaciones, zonas y sensores.
* **Control de Iluminación**: Sensores que expanden grupos (ej: `group.luces`, `group.pasillo`) para contar cuántas luces exactas hay encendidas en cada momento.

### ☀️ Astronomía y Ciclos (`dia_y_noche.yaml`)
* **Seguimiento Solar**: Monitorización del ángulo de elevación del sol y estado relativo al horizonte (arriba/abajo).
* **Binario Día/Noche**: Sensor simplificado para condicionar automatizaciones de iluminación exterior basadas en el amanecer y atardecer.

## 🛠️ Instalación y Organización

Para que Home Assistant cargue estos archivos, debes añadirlos a tu `configuration.yaml`. Tienes dos formas de hacerlo dependiendo de cómo prefieras organizar tu servidor

### Opción A: Carga automática de toda la carpeta (Recomendado)
Esta opción es la más limpia. Home Assistant fusionará todos los archivos `.yaml` que encuentre dentro de la carpeta `templates`.

```yaml
template: !include_dir_merge_list templates

### Opción B:Si prefieres tener un control manual estricto sobre qué archivos se cargan y en qué orden:
template:
  - !include templates/meteorologia.yaml
  - !include templates/contadores.yaml
  - !include templates/saludos_aleatorios.yaml
  # ... añadir manualmente cada nuevo archivo

