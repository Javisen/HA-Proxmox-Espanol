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
⚠️ Nota: si la RAM está al límite, la swap puede llenarse de nuevo automáticamente.
Mejor hacerlo tras liberar memoria de servicios pesados o tras reiniciar el nodo.

## 🛠️ 3. Gestión de VMs y Contenedores

- Detener o eliminar **servicios no críticos** libera **RAM y CPU**  
- Prioriza servicios **críticos** y monitoriza el uso de recursos con `top` o `glances`  
- Observa **load average vs cores** para detectar saturación  
- Ajusta **límites de memoria** en contenedores LXC si algunos servicios usan picos temporales

## 📊 4. Monitorización y ajustes

- Mantén al menos **20–30 % de RAM libre** para evitar swap constante  
- Observa **load average y CPU** para detectar cuellos de botella  
- Mantén **disco con suficiente espacio libre** (>30 %) para evitar lentitud de VMs  
- Herramientas recomendadas: `glances`, `htop`, panel de Proxmox Analytics

---

## 💡 5. Buenas prácticas

- Realiza **backups diarios** de todas las VMs y contenedores  
- Documenta configuraciones, scripts y automatizaciones  
- Mantén hardware modular y servicios aislados  
- Considera **expandir RAM antes de añadir un nodo** para workloads intensivos en memoria

## 🚀 6. Optimización avanzada

- Subir RAM para mayor estabilidad y margen  
- Activar KSM permanentemente al inicio (`/etc/default/grub`)

```bash
# Ejemplo:
GRUB_CMDLINE_LINUX_DEFAULT="quiet ksm=1"
update-grub
reboot
```
- Ajustar swappiness para reducir uso de swap:

```bash
sysctl vm.swappiness=10
```
- Considerar zram para sistemas con RAM limitada
- Revisar regularmente pages_shared de KSM para ver el ahorro real

## 🔑 Conclusión

Con estos ajustes:

- Se libera RAM de manera efectiva  
- Se reduce el uso de swap y micro-lags  
- Se mantiene la estabilidad incluso con múltiples VMs o contenedores  
- Se optimiza la eficiencia sin necesidad de invertir en hardware adicional inmediatamente
