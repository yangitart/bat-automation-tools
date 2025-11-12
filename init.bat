@echo off
echo.
echo ========================================
echo INICIANDO PROYECTO CUBA SCIENCE PLAN
echo ========================================
echo.

:: Obtener la ruta actual
set "CURRENT_DIR=%CD%"

:: Normalizar rutas para comparar (quitar barras invertidas dobles, etc.)
set "FRONTEND_DIR=D:\Trabajo\cuba-science-plan-frontend"

:: Comparar si estamos en la carpeta del frontend
if /i "%CURRENT_DIR%"=="%FRONTEND_DIR%" (
    echo [FRONTEND] Detectado: Iniciando frontend con npm run dev
    echo.
    cd /d "%FRONTEND_DIR%\frontend"
    npm run dev
) else (
    echo [BACKEND] Iniciando servidor Django...
    echo.
    :: Cambiar a la unidad D:
    D:
    :: Activar entorno virtual
    cd /d "D:\Trabajo\cuba-science-plan-backend\backend\env\Scripts"
    call activate
    :: Ir al proyecto Django
    cd /d "D:\Trabajo\cuba-science-plan-backend\backend\science_plan"
    :: Ejecutar servidor
    echo.
    echo ========================================
    echo SERVIDOR DJANGO INICIADO
    echo ========================================
    echo.
    python manage.py runserver
)

:: Mantener ventana abierta si hay error
pause