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
echo. Has elegido la opcion No. 1 Información Volátil
echo ------------------------------------------------------------------------------
echo 1 Generar la Fecha
echo 2 Generar la Hora
echo 3 Lista de Procesos
echo 4 Lista de Librerias
echo 5 Todas las anteriores
echo 6 Salir
echo ------------------------------------------------------------------------------
echo.
::Aquí van las líneas de comando de tu opción
	SET /p var1= ^> Seleccione una opcion [1-6]:

	if "%var1%"=="0" goto inicio1
	if "%var1%"=="1" goto op1_1
	if "%var1%"=="2" goto op1_2
	if "%var1%"=="3" goto op1_3
	if "%var1%"=="4" goto op1_4
	if "%var1%"=="5" goto op1_5
	if "%var1%"=="6" goto salir
::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var1%" no es una opcion invalida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio1
:op1_1
echo.
echo. Has elegido la opcion No. 1.1 Generar Fecha
cd heramientas_sys_internals
date /t > ..\resultados_volatiles\fecha.txt
echo. ya se creo el archivo en la carpeta resultados_volatiles
::cierre de la opcion 1
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