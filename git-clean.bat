@echo off
setlocal

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
echo     LIMPIAR ARCHIVOS NO RASTREADOS
echo ========================================
git clean -nd
echo.
set /p "CONFIRM=Confirmas limpiar? (s/N): "
if /i "%CONFIRM%"=="s" (
    git clean -fd
    echo.
    echo [OK] Limpieza completada.
) else (
    echo.
    echo Cancelado por el usuario.
)
echo.
pause
