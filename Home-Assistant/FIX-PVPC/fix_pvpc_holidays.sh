#!/bin/bash
# Script para parchear los festivos de la integración PVPC en Home Assistant (Docker)
# Basado en la configuración de Javier - Enero 2026

echo "🛠️ Aplicando parche de festivos 2025/2026 a la integración PVPC..."

docker exec -i homeassistant python3 -c "
import re
from pathlib import Path

def patch_pvpc():
    new_holidays = '''_NATIONAL_EXTRA_HOLIDAYS_FOR_P3_PERIOD: dict[int, set[date]] = {
    2025: {
        date(2025, 1, 1), date(2025, 1, 6), date(2025, 4, 18),
        date(2025, 5, 1), date(2025, 8, 15), date(2025, 12, 8),
        date(2025, 12, 25),
    },
    2026: {
        date(2026, 1, 1), date(2026, 1, 6), date(2026, 4, 3),
        date(2026, 5, 1), date(2026, 10, 12), date(2026, 12, 7),
        date(2026, 12, 8), date(2026, 12, 25),
    },
}'''

    found = False
    for p in Path('/usr/local/lib/').glob('**/aiopvpc/pvpc_tariff.py'):
        content = p.read_text()
        pattern = r'_NATIONAL_EXTRA_HOLIDAYS_FOR_P3_PERIOD.*?\n}'
        new_content = re.sub(pattern, new_holidays, content, flags=re.DOTALL)
        
        if new_content != content:
            p.write_text(new_content)
            print(f'✅ Archivo actualizado en: {p}')
            found = True
            
    if not found:
        print('⚠️ No se encontró el archivo o el bloque ya estaba actualizado.')

patch_pvpc()
"

echo "♻️ Reiniciando Home Assistant para aplicar cambios..."
docker restart homeassistant
echo "🚀 ¡Todo listo!"
