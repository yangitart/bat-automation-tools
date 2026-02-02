@echo off
setlocal

set "BRANCH_NAME=%~1"
set "BASE=%~2"

if "%BRANCH_NAME%"=="" (
    echo Uso: git-new-branch.bat nombre-rama [base]
    echo Ejemplo: git-new-branch.bat feature/mi-tarea main
    pause
    exit /b 1
)

if "%BASE%"=="" set "BASE=main"

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
echo    CREANDO RAMA %BRANCH_NAME% DESDE %BASE%
echo ========================================
git fetch --prune origin
git checkout %BASE%
if errorlevel 1 (
    echo [ERROR] No se pudo cambiar a %BASE%.
    pause
    exit /b 1
)
git pull --ff-only
git checkout -b %BRANCH_NAME%
if errorlevel 1 (
    echo [ERROR] No se pudo crear la rama.
    pause
    exit /b 1
)
echo.
echo [OK] Rama creada: %BRANCH_NAME%
echo.
pause
