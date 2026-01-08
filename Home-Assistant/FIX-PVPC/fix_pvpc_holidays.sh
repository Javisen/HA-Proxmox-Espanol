docker exec -it homeassistant python3 -c "
import re
from pathlib import Path

def patch_pvpc():
    for p in Path('/usr/local/lib/').glob('**/aiopvpc/pvpc_tariff.py'):
        content = p.read_text()
        
        # Definimos el nuevo bloque de años que queremos inyectar
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

        # Usamos una expresión regular para encontrar el bloque antiguo y reemplazarlo
        pattern = r'_NATIONAL_EXTRA_HOLIDAYS_FOR_P3_PERIOD.*?\n}'
        new_content = re.sub(pattern, new_holidays, content, flags=re.DOTALL)
        
        if new_content != content:
            p.write_text(new_content)
            print(f'✅ Archivo actualizado correctamente en: {p}')
        else:
            print(f'⚠️ No se pudo aplicar el parche en {p}. Comprueba si el patrón ha cambiado.')

patch_pvpc()
"
