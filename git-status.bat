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
echo           ESTADO RAPIDO
echo ========================================
git status -sb
echo.
git --no-pager diff --stat
echo.
pause
