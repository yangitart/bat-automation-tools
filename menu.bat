@echo off
setlocal

echo ========================================
echo            MENU DE COMANDOS
echo ========================================
echo 1) Estado rapido (git-status.bat)
echo 2) Diff completo (diff.bat)
echo 3) Log con grafico (git-log.bat)
echo 4) Sincronizar (git-sync.bat)
echo 5) Crear rama (git-new-branch.bat)
echo 6) Limpiar no rastreados (git-clean.bat)
echo 7) Guardar cambios (git-stash.bat)
echo 8) Hola pro (hola.bat)
echo 9) Salir
echo.
set /p "CHOICE=Selecciona una opcion [1-9]: "

if "%CHOICE%"=="1" call git-status.bat
if "%CHOICE%"=="2" call diff.bat
if "%CHOICE%"=="3" call git-log.bat
if "%CHOICE%"=="4" call git-sync.bat
if "%CHOICE%"=="5" call git-new-branch.bat
if "%CHOICE%"=="6" call git-clean.bat
if "%CHOICE%"=="7" call git-stash.bat
if "%CHOICE%"=="8" call hola.bat
if "%CHOICE%"=="9" goto end

:end
exit /b 0
