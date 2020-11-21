@echo off
TITLE Bienvenid@ %USERNAME%
MODE con:cols=80 lines=40

:inicio
SET var=0
cls
echo Bienvenid@ %USERNAME%
echo ------------------------------------------------------------------------------
echo %DATE% ^| %TIME%
echo ------------------------------------------------------------------------------
echo 1 Información Volátil
echo 2 Volatility
echo 3 Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-3]:

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion invalida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio
:op1
echo.
echo. Has elegido la opcion No. 1
echo.
::Aquí van las líneas de comando de tu opción
color 08
echo.
pause
goto:inicio
:op2
echo.
echo. Has elegido la opcion No. 2
echo.
::Aquí van las líneas de comando de tu opción
color 08
echo.
pause
goto:inicio
:op3
echo.
echo. Has elegido la opcion No. 3
::Aquí van las líneas de comando de tu opción
color 08
echo.
pause
goto:inicio