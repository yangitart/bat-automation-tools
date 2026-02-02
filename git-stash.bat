@echo off
setlocal

set "MSG=%~1"
if "%MSG%"=="" set "MSG=WIP"

where git >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git no esta instalado o no esta en el PATH.
    pause
    exit /b 1
)

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Este directorio no es un repositorio Git.
    pause
    exit /b 1
)

echo ========================================
echo             GUARDAR CAMBIOS
echo ========================================
git stash push -m "%MSG%"
if errorlevel 1 (
    echo [ERROR] No se pudo hacer stash.
    pause
    exit /b 1
)
echo.
echo [OK] Cambios guardados: %MSG%
echo.
pause
