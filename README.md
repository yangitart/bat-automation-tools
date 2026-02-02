# 🧰 Bat Automation Tools

Colección personal de scripts `.bat` para automatizar tareas en Windows.  
Este repositorio está en crecimiento y se irá actualizando constantemente con nuevos comandos útiles.

## 🚀 Comandos disponibles

### Utilidades generales
- `menu.bat`: menú rápido para ejecutar los comandos más usados.
- `hola.bat`: saludo extendido con fecha, hora y rama Git actual.
- `init.bat [frontend|backend|auto]`: inicia frontend (npm) o backend (Django) según modo.
- `red.bat`: inicia CNTLM y restaura el proxy original al cerrar.

### Git
- `diff.bat`: estado completo con diff en stage, sin stage y resumen.
- `git-status.bat`: estado corto + resumen de cambios.
- `git-log.bat`: historial en gráfico (últimos 30 commits).
- `git-sync.bat [remote]`: fetch + pull con `--ff-only`.
- `git-new-branch.bat <rama> [base]`: crea rama desde `main` (o base).
- `git-clean.bat`: limpia archivos no rastreados con confirmación.
- `git-stash.bat [mensaje]`: guarda cambios con mensaje.
