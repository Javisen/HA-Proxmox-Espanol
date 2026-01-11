# 🖼️ Homarr: Dashboard Unificado

Este directorio contiene la configuración visual y técnica del dashboard principal. Homarr actúa como la interfaz centralizada para gestionar todos los servicios alojados en el nodo Proxmox (HP EliteDesk) y el servidor de audio (Dell Optiplex).

## 📸 Vista General
<p align="left"> <img src="./homarr.png" alt="Dashboard de Homarr en navegador" height="380"> <img src="./movil.png" alt="Dashboard de Homarr en móvil" height="380"> </p>

*Estado final del panel con el tema "Dark Tech" y los widgets organizados por categorías. Vista de Movil añadida con iframes escalados de la página de Volumio y de una tarjeta de HA de Alarmo*

## 🎨 Personalización CSS (Look & Feel)
El panel utiliza una hoja de estilos personalizada para lograr una estética profesional, técnica y funcional. Los estilos están diseñados para reducir la fatiga visual mientras mantienen una jerarquía clara.

### Características del Diseño:
* **Fondo Técnico:** Una cuadrícula tipo "blueprint" con opacidad reducida sobre un fondo gris carbono.
* **Efecto Cristal (Glassmorphism):** Widgets con transparencia y desenfoque de fondo (`backdrop-filter`).
* **Codificación por Colores:** Uso selectivo de bordes neón y fondos degradados para identificar servicios de Red, Multimedia, Descargas e Infraestructura.

## 📄 Archivos de Configuración
* **`custom_css.yaml`**: Contiene todas las clases CSS aplicadas al panel.

### 💡 Cómo aplicar los estilos:
1. Accede a **Ajustes > Apariencia** en tu instancia de Homarr.
2. Copia el contenido de `custom_css.yaml` en el cuadro de **Custom CSS**.
3. Para los bordes neón individuales, añade la clase correspondiente (ej: `borde-neon-verde`) en los metadatos de cada widget.

---

## 🛠️ Integración Especial: Volumio y Home Assistant
Uno de los puntos clave de este dashboard es el widget de **Volumio**. 
* **Escalado:** Se utiliza un wrapper HTML externo para incrustar la interfaz al **65%**, permitiendo el control total del reproductor y de una tarjeta de Alarmo sin ocupar todo el espacio del panel.
* **Seguridad:** Configuración de `use_x_frame_options: false` en Home Assistant para permitir la carga del recurso.
* **Configuracion:** Añadido archivos HTML en local (/www) de Home Assistant
**Codigo:**
```
<!DOCTYPE html>
<html>
<head>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            overflow: hidden; /* Evita barras de scroll dobles */
            background-color: transparent;
        }
        #scaled-frame {
            /* Escalado al 65% */
            width: 153.84%;  /* 100 / 0.65 */
            height: 153.84%; /* 100 / 0.65 */
            border: none;
            -webkit-transform: scale(0.65);
            transform: scale(0.65);
            -webkit-transform-origin: 0 0;
            transform-origin: 0 0;
        }
    </style>
</head>
<body>
    <iframe id="scaled-frame" src="http://192.168.31.118/playback"></iframe>
</body>
</html>
```
