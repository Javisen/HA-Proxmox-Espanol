# ⚡ Tips y Trucos para Optimizar Proxmox

Este documento reúne **tips, trucos y mejoras** para mantener un nodo Proxmox estable, eficiente y con buen rendimiento de RAM y CPU.

---

## 🧠 1. Activar KSM (Kernel Samepage Merging)

KSM permite **deduplicar páginas de memoria idénticas** entre VMs y contenedores, liberando RAM y reduciendo uso de swap.

**Activación por terminal:**

```bash
# Activar KSM
echo 1 > /sys/kernel/mm/ksm/run

# Configurar número de páginas a escanear por iteración
echo 1000 > /sys/kernel/mm/ksm/pages_to_scan

# Ajustar tiempo de espera entre iteraciones (ms)
echo 20 > /sys/kernel/mm/ksm/sleep_millisecs
```
**Comprobar estado de KSM:**
```bash
cat /sys/kernel/mm/ksm/pages_shared
cat /sys/kernel/mm/ksm/pages_sharing
```
## 🧹 2. Limpiar swap manualmente

Si la swap está ocupada pero tienes RAM libre, puedes liberarla:

```bash
swapoff -a && swapon -a
```
# ⚠️ Nota: si la RAM está al límite, la swap puede llenarse de nuevo automáticamente.
Mejor hacerlo tras liberar memoria de servicios pesados o tras reiniciar el nodo.

## 🛠️ 3. Gestión de VMs y Contenedores

- Detener o eliminar **servicios no críticos** libera **RAM y CPU**  
- Prioriza servicios **críticos** y monitoriza el uso de recursos con `top` o `glances`  
- Observa **load average vs cores** para detectar saturación  
- Ajusta **límites de memoria** en contenedores LXC si algunos servicios usan picos temporales

