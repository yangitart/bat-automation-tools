@echo off
echo.
echo ================================
echo       ESTADO DEL REPOSITORIO
echo ================================
git status
echo.
echo ================================
echo     CAMBIOS PENDIENTES (DIFF HEAD)
echo ================================
git --no-pager diff HEAD
echo.
pause