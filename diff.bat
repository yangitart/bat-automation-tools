@echo off
setlocal enabledelayedexpansion

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

for /f "delims=" %%R in ('git rev-parse --show-toplevel') do set "REPO_ROOT=%%R"
for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "BRANCH=%%B"

echo.
echo ========================================
echo          ESTADO DEL REPOSITORIO
echo ========================================
echo Repo: %REPO_ROOT%
echo Rama: %BRANCH%
echo.
git status -sb
echo.
echo ========================================
echo          CAMBIOS EN STAGE
echo ========================================
git --no-pager diff --staged
echo.
echo ========================================
echo        CAMBIOS SIN STAGE
echo ========================================
git --no-pager diff
echo.
echo ========================================
echo            RESUMEN (STAT)
echo ========================================
git --no-pager diff --stat
echo.
pause
