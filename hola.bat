@echo off
setlocal

echo ========================================
echo           HOLA MUNDO PRO+
echo ========================================
echo.
echo Fecha: %DATE%
echo Hora : %TIME%
echo.
echo Directorio actual: %CD%
echo.

where git >nul 2>&1
if errorlevel 1 (
    echo Git: No disponible en PATH
) else (
    git rev-parse --is-inside-work-tree >nul 2>&1
    if errorlevel 1 (
        echo Git: No es un repo
    ) else (
        for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "BRANCH=%%B"
        echo Git: Rama actual %BRANCH%
    )
)
echo.
pause
