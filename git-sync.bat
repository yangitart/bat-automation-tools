@echo off
setlocal

set "REMOTE=%~1"
if "%REMOTE%"=="" set "REMOTE=origin"

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
echo        SINCRONIZANDO CON %REMOTE%
echo ========================================
git fetch --prune %REMOTE%
if errorlevel 1 (
    echo [ERROR] Fallo el fetch.
    pause
    exit /b 1
)

git pull --ff-only %REMOTE%
if errorlevel 1 (
    echo [ERROR] Fallo el pull. Revisa conflictos o permisos.
    pause
    exit /b 1
)

echo.
echo [OK] Repo sincronizado con %REMOTE%.
echo.
pause
