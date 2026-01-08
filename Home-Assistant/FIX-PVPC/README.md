## ⚡ Fix de Emergencia: Tarifas PVPC (Festivos 2026)

La integración oficial suele fallar al inicio del año por falta de actualización del calendario de festivos nacionales. Esto provoca errores de tipo `KeyError: 2026`.

### Instrucciones de uso:
Si la integración PVPC no carga tras una actualización de Home Assistant:
1. Accede a tu terminal (PuTTY) en el servidor Proxmox.
2. Copia y ejecuta el contenido de `fix_pvpc_holidays.txt`.
3. El script parcheará el archivo interno del contenedor y reiniciará el servicio automáticamente.

> **Nota:** Este parche es necesario porque los cambios dentro del contenedor son volátiles y se pierden al actualizar la imagen de Home Assistant.
