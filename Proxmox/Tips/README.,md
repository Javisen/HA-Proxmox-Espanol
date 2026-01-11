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
