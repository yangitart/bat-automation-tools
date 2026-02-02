@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo     INICIANDO CNTLM CON PROXY LOCAL
echo ========================================
echo.

set "CNTLM_DIR=C:\Program Files\cntlm"
set "CNTLM_CONF=cntlm.ini"
set "LOCAL_PROXY=127.0.0.1:3128"

if not exist "%CNTLM_DIR%\cntlm.exe" (
    echo [ERROR] No se encontro cntlm.exe en "%CNTLM_DIR%".
    pause
    exit /b 1
)

:: === 1. Guardar proxy actual del sistema ===
echo [1/4] Guardando configuracion actual de proxy...
for /f "tokens=2,*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable 2^>nul') do set "PROXY_ENABLE=%%B"
for /f "tokens=2,*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer 2^>nul') do set "PROXY_SERVER=%%B"

set "OLD_PROXY_ENABLE=%PROXY_ENABLE%"
set "OLD_PROXY_SERVER=%PROXY_SERVER%"

echo    Proxy habilitado: %OLD_PROXY_ENABLE%
echo    Servidor proxy  : %OLD_PROXY_SERVER%
echo.

:: === 2. Configurar proxy local (127.0.0.1:3128) ===
echo [2/4] Configurando proxy local: %LOCAL_PROXY%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "%LOCAL_PROXY%" /f >nul
echo    [OK] Proxy configurado
echo.

:: === 3. Iniciar cntlm en primer plano ===
echo [3/4] Iniciando cntlm (presiona Ctrl+C para detener)...
echo.
pushd "%CNTLM_DIR%"
start "" /wait cntlm -f -v -c "%CNTLM_CONF%"
popd

:: === 4. Restaurar proxy original al cerrar ===
echo.
echo [4/4] Restaurando configuracion original de proxy...
if "%OLD_PROXY_ENABLE%"=="0" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
    echo    Proxy deshabilitado (como estaba antes)
) else if "%OLD_PROXY_ENABLE%"=="1" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "%OLD_PROXY_SERVER%" /f >nul
    echo    Proxy restaurado: %OLD_PROXY_SERVER%
) else (
    echo    [ADVERTENCIA] No se detecto estado previo. Deshabilitando proxy.
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
)

echo.
echo ========================================
echo       CNTLM CERRADO - PROXY RESTAURADO
echo ========================================
echo.
pause
