@echo off

:menu
	echo "¿Que operacion desea realizar?"
	echo 1.Autentificar
	echo 2.Obtener perfiles de usuarios
	echo 3.Obtener tweets de usuarios
	echo 4.Realizar busquedas en twitter
	echo 5.Obtener tweets en tiempo real
	echo 6.Salir
	set /P operacion="Elige operacion: " 

	if "%operacion%"=="1" goto auth
	if "%operacion%"=="2" goto profile
	if "%operacion%"=="3" goto tweets
	if "%operacion%"=="4" goto search
	if "%operacion%"=="5" goto streaming
	if "%operacion%"=="6" exit

:auth
	cd keys
	set /P usuario=Escribe tu usuario de twitter: 
	c:\python27\python.exe ..\scripts\tweet_auth.py UNIA_app.key %usuario%
	cd ..
	goto menu
	

:profile
	set /P fichero=Introduce el nombre del fichero: 
	echo %fichero%
	set /P usuario=Escribe tu usuario de twitter: 
	echo %usuario%

	c:\python27\python.exe "scripts\tweet_rest.py" "keys\UNIA_app.key" "keys\%usuario%.key" "datos\%fichero%" --profile
	
	goto menu

:tweets
	set /P fichero="Introduce el nombre del fichero: "
	echo %fichero%
	set /P usuario="Escribe tu usuario de twitter: "
	echo %usuario%

	c:\python27\python.exe "scripts\tweet_rest.py" "keys\UNIA_app.key" "keys\%usuario%.key" "datos\%fichero%" --tweets

	goto menu

:search
	set /P usuario="Escribe tu usuario de twitter: "
	set /P palabra="Palabra de busqueda: "

	c:\python27\python.exe "scripts\tweet_search.py" "keys\UNIA_app.key" "keys\%usuario%.key" --query %palabra%

	goto menu

:streaming
	set /P fichero="Introduce el nombre del fichero: "
	set /P usuario="Escribe tu usuario de twitter: "
	set /P fich_salida="Escribe el nombre del fichero a generar: "
 
	c:\python27\python.exe "scripts\tweet_streaming.py" "keys\UNIA_app.key" "keys\%usuario%.key" .\ %fich_salida% --words datos\%fichero%

	goto menu
