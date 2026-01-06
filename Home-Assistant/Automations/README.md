# 🤖 Home Assistant: El Cerebro de la Instalación

Este directorio contiene la lógica y las automatizaciones que dan vida a mi hogar inteligente. El objetivo de esta sección es mostrar cómo integrar sensores físicos y servicios en la nube para crear rutinas que mejoren el día a día, ejecutándose de forma robusta sobre un servidor **Proxmox**.

![Automatizaciones](https://img.shields.io/badge/Lógica-YAML_&_UI-orange?style=for-the-badge&logo=home-assistant)

---

## 🧠 Filosofía de mis Automatizaciones

Mis rutinas están diseñadas bajo tres principios:
1. **Invisibilidad:** La tecnología debe actuar sin que el usuario tenga que pedirlo.
2. **Eficiencia:** Optimización de recursos del servidor.
3. **Resiliencia:** Notificaciones y alertas críticas que funcionan incluso si falla la conexión externa.

---

## 📁 Organización por Estancias y Propósito

He dividido las automatizaciones para facilitar su implementación y mantenimiento:

* **🧼 [Cocina-Galeria](./Cocina-Galeria):** Gestión de electrodomésticos y estados de limpieza.
* **⚖️ [Control de peso](./Control_de_peso):** Lógica para el seguimiento de métricas de salud y reseteo de datos diarios.
* **🛌 [Dormitorio](./Dormitorio):** Escenas de iluminación y confort nocturno.
* **🚪 [Entrada](./Entrada):** Automatizaciones de seguridad, bienvenida y gestión de la alarma.
* **📦 [Varias](./Varias):** Scripts de mantenimiento del sistema, notificaciones de red Gigabit y estados del servidor.

---

## 🛠️ Integración con Hardware Crítico

Estas automatizaciones interactúan directamente con el ecosistema descrito en el Dashboard:
* **Multimedia:** Control del flujo de audio entre el **Dell Optiplex (Volumio)** y el amplificador **Denon**.
* **Clima:** Lógica de protección basada en sensores de lluvia y alertas de AEMET.

---

## 📝 Cómo usar estos ejemplos
Cada subcarpeta incluye archivos `.yaml` con el código listo para ser adaptado. Puedes copiarlos directamente en tu `automations.yaml` o usarlos como base para crear nuevas rutinas en el editor visual de Home Assistant.

> **Nota:** Algunas automatizaciones requieren *Helpers* (Ayudantes) específicos como `input_boolean` o `timer` para funcionar correctamente.

---
*Explora el código y haz que tu casa trabaje para ti.*
