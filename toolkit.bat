@echo off
TITLE Bienvenid@ %USERNAME%
MODE con:cols=80 lines=40

:inicio
SET var=0
SET var1=0
SET maquina=0
SET suggested=0
SET perfil=0

wmic bios get serialnumber | find "SerialNumber" /v > archivos_temporales/serial_temp.txt
set /p maquina=<archivos_temporales/serial_temp.txt
echo %maquina%

cls
echo Bienvenid@ %USERNAME% - Usted esta en la máquina con serial %maquina%
echo ------------------------------------------------------------------------------
echo %DATE% ^| %TIME%
echo ------------------------------------------------------------------------------
echo 1 Información Volátil
echo 2 Volatility (*) Se requiere imagen en formato raw
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
echo.
:inicio1
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
	if "%var1%"=="6" goto inicio
::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var1%" no es una opcion invalida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio1
:op1_1
:: comienza la opcion 1.1
echo.
echo. Has elegido la opcion No. 1.1 Generar Fecha
cd heramientas_sys_internals
date /t > ..\resultados_volatiles\fecha_%maquina%_.txt
echo. ya se creo el archivo de fecha en la carpeta resultados_volatiles
:: cierra la opción 1.1
echo.
pause
goto:inicio1
:op1_2
:: comienza la opcion 1.2
echo.
echo. Has elegido la opcion No. 1.2 Generar la Hora
cd heramientas_sys_internals
time /t > ..\resultados_volatiles\hora_%maquina%_.txt
echo. ya se creo el archivo de hora en la carpeta resultados_volatiles
echo.
pause
goto:inicio1
:: cierra la opción 1.2
:op1_3
:: comienza la opcion 1.3
echo.
echo. Has elegido la opcion No. 1.3 Lista de Procesos
cd heramientas_sys_internals
pslist > ..\resultados_volatiles\listado_procesos.txt
echo. ya se creo el archivo de listado de procesos en la carpeta resultados_volatiles
echo.
pause
goto:inicio1
:: cierra la opción 1.3
:op1_4
:: comienza la opcion 1.4
echo.
echo. Has elegido la opcion No. 1.4 Lista de Librerias
cd heramientas_sys_internals
listdlls > ..\resultados_volatiles\listado_librerias.txt
echo. Se ha Generado el archivo de librerias en la carpeta resultados_volatiles
echo.
pause
goto:inicio1
:: cierra la opción 1.4
:op1_5
:: comienza la opcion 1.5
echo.
echo. Has elegido la opcion No. 1.5 Todas las anteriores
cd heramientas_sys_internals
date /t > ..\resultados_volatiles\fecha_%maquina%_.txt
time /t > ..\resultados_volatiles\hora_%maquina%_.txt
pslist > ..\resultados_volatiles\listado_procesos.txt
listdlls > ..\resultados_volatiles\listado_librerias.txt
echo. Se ha Generado el los archivos en la carpeta resultados_volatiles
echo.
pause
goto:inicio1
:: cierra la opción 1.5
::cierre de la opcion 1
color 08
echo.
pause
goto:inicio



:: comienza la opción 2
:op2
echo.
echo. Has elegido la opcion No. 2
echo.
:inicio2
SET var2=0
cls
echo ------------------------------------------------------------------------------
echo %DATE% ^| %TIME%
echo ------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------
echo Para ejecutar alguna de estas opciones es necesario que aloje la imagen .raw
echo imagenes_forenses con el nombre memoria.raw
echo ------------------------------------------------------------------------------
echo 2.1 Generar Info de Imagen
echo 2.2 Generar Info del Kernel
echo 2.3 Generar Info del Kernel a Nivel Jerarquico
echo 2.4 Generar Lista de Librerias
echo 2.5 Generar Uso de Aplicativos
echo 2.6 Reconstruir y Volcar Ejecutables
echo 2.7 Reconstruir y Volcar Librerias
echo 2.8 Reconstruir Eventos
echo 2.9 Objetos y Ubicacion en memoria RAM
echo 2.10 Metadatos de Archivos
echo 2.11 Dispositivos Conectados
echo 2.12 Ubicación de Registros del Sistema
echo 2.13 Reconstruir Archivos de Sistema
echo 2.14 Hash de Contrasena de Usuario
echo 2.15 Salir
echo ------------------------------------------------------------------------------
echo.



SET /p var2= ^> Seleccione una opcion [1 - 15]:



if "%var2%"=="0" goto inicio
if "%var2%"=="1" goto op2_1
if "%var2%"=="2" goto op2_2
if "%var2%"=="3" goto op2_3
if "%var2%"=="4" goto op2_4
if "%var2%"=="5" goto op2_5
if "%var2%"=="6" goto op2_6
if "%var2%"=="7" goto op2_7
if "%var2%"=="8" goto op2_8
if "%var2%"=="9" goto op2_9
if "%var2%"=="10" goto op2_10
if "%var2%"=="11" goto op2_11
if "%var2%"=="12" goto op2_12
if "%var2%"=="13" goto op2_13
if "%var2%"=="14" goto op2_14
if "%var2%"=="15" goto inicio



::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var2%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio2
:: Inicia la opción 2.1
:op2_1
echo.
echo. Has elegido la opcion No. 2.1 Generar Info de Imagen
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo > ..\resultados_artefactos\info_imagen_raw.txt
echo. Ya se creo la información de la Imagen en la ruta especificada......
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.1
:: Inicia la opción 2.2
:op2_2
echo.
echo. Has elegido la opción No. 2.2 Generar Info del Kernel
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% pslist> ..\resultados_artefactos\info_kernel_offset.txt
echo. Ya se creo la información del Kernel en la ruta especificada......
echo.
pause
:: Se cierra la opción 2.2
:: Inicia la opción 2.3
:op2_3
echo.
echo. Has elegido la opcion No. 2.3 Generar Info del Kernel a Nivel Jerarquico
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% pstree> ..\resultados_artefactos\info_kernel_jerarquia.txt
echo. Ya se creo la información del Kernel jerarquicamente en la ruta 
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.3
:: Inicia la opción 2.4
:op2_4
echo.
echo. Has elegido la opcion No. 2.4 Generar Lista de Librerias
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% dlllist> ..\resultados_artefactos\info_kernel_librerias.txt
echo.Ya se creo la información de las librerias en la ruta especificada...... 
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.4
:: Inicia la opción 2.5
:op2_5
echo.
echo. Has elegido la opcion No. 2.5 Generar Uso de Aplicativos
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% handles > ..\resultados_artefactos\que_hace_el_app.txt
echo.Ya se creo la información de los Aplicativos en la ruta especificada...... 
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.5
:: Inicia la opción 2.6
:op2_6
echo.
echo. Has elegido la opcion No. 2.6 Reconstruir y Volcar Ejecutables
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% procexedump --dump-d ..\resultados_artefactos\ejecutables
echo.Ya se creo la información de los Aplicativos en la ruta especificada...... 
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.6
:: Inicia la opción 2.7
:op2_7
echo.
echo. Has elegido la opcion No. 2.7 Reconstruir y Volcar Librerias
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% dlldump --dump-d ..\resultados_artefactos\librerias
echo.Ya se creo la información de las Librerias Reconstruidas en la ruta especificada.....
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.7
:: Inicia la opción 2.8
:op2_8
echo.
echo. Has elegido la opcion No. 2.8 Reconstruir Eventos
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% timeliner > ..\resultados_artefactos\Linea_de_tiempo.txt
echo.Ya se creo la información de los eventos reconstruidos en la ruta.....
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.8
:: Inicia la opción 2.9
:op2_9
echo.
echo. Has elegido la opcion No. 2.9 Objetos y Ubicación en memoria RAM
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% filescan > ..\resultados_artefactos\objetos_en_ram.txt
echo.Ya se creo la información de la ubicación de los objetos en la ruta.....
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.9
:: Inicia la opción 2.10
:op2_10
echo.
echo. Has elegido la opcion No. 2.10 Metadatos de Archivos
echo.
cd volatility
volatility.exe -f ..\imagenes_forenses\memoria.raw imageinfo | findstr Suggested > ..\archivos_temporales\suggested_temp.txt
set /p suggested=<..\archivos_temporales\suggested_temp.txt
echo Perfiles Encontrados en la imagen
echo .......................................................
echo %suggested%
echo .......................................................
SET /p perfil= ^> Digite el segundo perfil de la linea anterior para la busqueda:
volatility.exe -f  ..\imagenes_forenses\memoria.raw --profile=%perfil% kdbgscan | findstr (V) > ..\archivos_temporales\offset_temp.txt
set /p offset=<..\archivos_temporales\offset_temp.txt
echo Apuntadores de Menoria en la imagen
echo .......................................................
echo %offset%
echo .......................................................
SET /p apuntador= ^> Digite el apuntador en pantalla para la busqueda:
volatility.exe -f ..\imagenes_forenses\memoria.raw --profile=%perfil% --kdbg=%apuntador% mftparser > ..\resultados_artefactos\metadatos.txt
echo.Ya se creo la información de los metadatos en la ruta especificada.....
echo.
pause
goto:inicio2
echo.
pause
:: Se cierra la opción 2.10
goto:inicio
:: cierra la opción 2
:op3
echo.
echo. Has elegido la opcion No. 3
::Aquí van las líneas de comando de tu opción
echo.
pause
goto:inicio