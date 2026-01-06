# 🏠 Home Assistant Dashboard - Clima & Alertas Dinámicas

Este repositorio contiene la configuración avanzada para el panel de control meteorológico y el sistema de gestión de presencia visual. El diseño está optimizado para su visualización desde el puesto de trabajo (**Lenovo Ideacentre**) mientras el servidor corre en **Proxmox**.

## 📸 Vistas Previas
| Estado de Alerta Activa | Estado de Clima Normal |
| :---: | :---: |
| ![Alertas](alertas.png) | ![Clima Dinámico](alertas2.png) |

---

## 🛠️ Requerimientos Técnicos

### Dependencias HACS (Obligatorias)
Para que la interfaz funcione correctamente, debes instalar:
* [Mushroom Cards](https://github.com/piitaya/lovelace-mushroom)
* [Stack-in-card](https://github.com/custom-cards/stack-in-card)
* [Card-mod](https://github.com/thomasloven/lovelace-card-mod)
* [Meteoalarm Card](https://github.com/MrInternal/meteoalarm-card)

### Recursos Multimedia
Asegúrate de que las imágenes estén en la ruta `/local/clima/` (que corresponde a la carpeta física `/config/www/clima/`):
* `noche3.png`, `amanecer.png`, `soleado3.png`, `lloviendo.png`, `nublado.png`.

---

## 🕒 Gestión de Inactividad (Temporizador)

Para mantener el dashboard limpio y evitar distracciones visuales en tu Lenovo de trabajo, el panel de controles activos se oculta tras un periodo de inactividad.

### 1. Crear el Helper
Ve a **Ajustes > Dispositivos y Servicios > Ayudantes** y crea un temporizador:
* **Entidad:** `timer.temporizador_pantalla`
* **Duración predeterminada:** `00:05:00` (5 minutos)

### 2. Automatización de Ocultación (YAML)
Añade esto a tu archivo `automations.yaml` o mediante el editor visual:

```yaml
alias: "Dashboard: Ocultar controles por inactividad"
description: "Apaga los controles si no hay interacción"
trigger:
  - platform: event
    event_type: timer.finished
    event_data:
      entity_id: timer.temporizador_pantalla
action:
  - service: input_boolean.turn_off
    target:
      entity_id: input_boolean.mostrar_controles_estancia
mode: restart
