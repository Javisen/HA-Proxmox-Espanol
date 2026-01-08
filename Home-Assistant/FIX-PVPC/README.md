## ⚡ Fix de Emergencia: Tarifas PVPC (Festivos 2026)

La integración oficial suele fallar al inicio del año por falta de actualización del calendario de festivos nacionales. Esto provoca errores de tipo `KeyError: 2026`.
Con el parche anterior cada vez que se actualizaba, volvia el error.
Con este nuevo se actualizan los festivos de 2026 y se soluciona hasta que los desarrolladores saquen una actualizacion oficial

### Instrucciones de uso:
Si la integración PVPC no carga tras una actualización de Home Assistant:
1. Accede a tu terminal (PuTTY) en el servidor HA o usa el terminar con proteccion deshabilitada.
2. Copia y ejecuta el contenido de `fix_pvpc_holidays.txt`.
3. El script parcheará el archivo interno del contenedor y SI LO HA PARCHEADO CORRECTAMENTE reiniciará Home Assistant.

> **Nota:** Este parche es necesario porque los cambios dentro del contenedor son volátiles y se pierden al actualizar la imagen de Home Assistant.
