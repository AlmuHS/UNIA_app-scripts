::Copyright 2016 Almudena Garcia Jurado-Centurion

::This program is free software: you can redistribute it and/or modify
::it under the terms of the GNU General Public License as published by
::the Free Software Foundation, either version 3 of the License, or
::(at your option) any later version.

::This program is distributed in the hope that it will be useful,
::but WITHOUT ANY WARRANTY; without even the implied warranty of
::MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::GNU General Public License for more details.

::You should have received a copy of the GNU General Public License
::along with this program.  If not, see <http://www.gnu.org/licenses/>.


@echo off

echo "Bienvenido a UNIA_app-script"
echo "-----------------------------"


set /P usuario="Escribe tu usuario de twitter: "

:menu
	echo "¿Que operacion desea realizar?"
	echo "1.Autentificar"
	echo "2.Obtener perfiles de usuarios"
	echo "3.Obtener tweets de usuarios"
	echo "4.Realizar busquedas en twitter"
	echo "5.Obtener tweets en tiempo real"
	echo "6.Salir"
	set /P operacion="Elige operacion: " 
	
	if "%operacion%"=="1" goto auth
	if "%operacion%"=="2" goto profile
	if "%operacion%"=="3" goto tweets
	if "%operacion%"=="4" goto search
	if "%operacion%"=="5" goto streaming
	if "%operacion%"=="6" exit

:auth
	cd keys
	c:\python27\python.exe ..\scripts\tweet_auth.py UNIA_app.key %usuario%
	cd ..
	goto menu
	

:profile
	set /P fichero="Introduce el nombre del fichero: "

	c:\python27\python.exe "scripts\tweet_rest.py" "keys\UNIA_app.key" "keys\%usuario%.key" "datos\%fichero%" --profile
	
	goto menu

:tweets
	set /P fichero="Introduce el nombre del fichero: "

	c:\python27\python.exe "scripts\tweet_rest.py" "keys\UNIA_app.key" "keys\%usuario%.key" "datos\%fichero%" --tweets

	goto menu

:search	
	set /P palabra="Palabra de busqueda: "

	c:\python27\python.exe "scripts\tweet_search.py" "keys\UNIA_app.key" "keys\%usuario%.key" --query %palabra%

	goto menu

:streaming
	set /P fichero="Introduce el nombre del fichero: "
	set /P fich_salida="Escribe el nombre del fichero a generar: "
 
	c:\python27\python.exe "scripts\tweet_streaming.py" "keys\UNIA_app.key" "keys\%usuario%.key" .\ %fich_salida% --words datos\%fichero%

	goto menu

