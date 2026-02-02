@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo INICIANDO PROYECTO CUBA SCIENCE PLAN
echo ========================================
echo.

:: Configuracion (ajusta rutas si cambian)
set "FRONTEND_ROOT=D:\Trabajo\cuba-science-plan-frontend"
set "FRONTEND_APP=%FRONTEND_ROOT%\frontend"
set "BACKEND_ROOT=D:\Trabajo\cuba-science-plan-backend\backend"
set "BACKEND_VENV=%BACKEND_ROOT%\env\Scripts"
set "BACKEND_APP=%BACKEND_ROOT%\science_plan"

:: Modo: frontend|backend|auto
set "MODE=%~1"
if "%MODE%"=="" set "MODE=auto"

if /i "%MODE%"=="frontend" goto start_frontend
if /i "%MODE%"=="backend" goto start_backend

:: Auto-deteccion por directorio actual
set "CURRENT_DIR=%CD%"
if /i "%CURRENT_DIR%"=="%FRONTEND_ROOT%" (
    goto start_frontend
) else (
    goto start_backend
)

:start_frontend
if not exist "%FRONTEND_APP%\package.json" (
    echo [ERROR] No se encontro package.json en %FRONTEND_APP%
    pause
    exit /b 1
)
echo [FRONTEND] Iniciando frontend con npm run dev
echo.
cd /d "%FRONTEND_APP%"
call npm run dev
goto end

:start_backend
if not exist "%BACKEND_VENV%\activate.bat" (
    echo [ERROR] No se encontro el entorno virtual en %BACKEND_VENV%
    pause
    exit /b 1
)
if not exist "%BACKEND_APP%\manage.py" (
    echo [ERROR] No se encontro manage.py en %BACKEND_APP%
    pause
    exit /b 1
)
echo [BACKEND] Iniciando servidor Django...
echo.
cd /d "%BACKEND_VENV%"
call activate
cd /d "%BACKEND_APP%"
echo.
echo ========================================
echo SERVIDOR DJANGO INICIADO
echo ========================================
echo.
python manage.py runserver

:end
pause
