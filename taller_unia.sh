opcion=0

while test $opcion -ne 6
do

	echo "¿Que operacion desea realizar?"
	echo "1.Autentificar"
	echo "2.Obtener perfiles de usuarios"
	echo "3.Obtener tweets de usuarios"
	echo "4.Realizar busquedas en twitter"
	echo "5.Obtener tweets en tiempo real"
	echo "6.Salir"

	while test $opcion -gt 6 || test $opcion -lt 1 
	do	
		echo "Introduzca numero de opcion: "
		read opcion
	done

	echo "Escribe tu usuario de twitter: "
	read usuario

	case $opcion in
		1)
			python "./scripts/tweet_auth.py" "./keys/UNIA_app.key" $usuario
		;;

		2)
		
			echo "Introduce el nombre del fichero: "
			read fichero

			python ./scripts/tweet_rest.py ./keys/UNIA_app.key ./keys/$usuario.key datos/$fichero --profile
		;;

		3)
		
			echo "Introduce el nombre del fichero: "
			read fichero
			
			python ./scripts/tweet_rest.py ./keys/UNIA_app.key ./keys/$usuario.key datos/$fichero --tweets
		;;	

		4)
		
			echo "Introduce el nombre del fichero: "
			read fichero

			
			echo "Introduce palabra a buscar: "
			read palabra

			python ./scripts/tweet_search.py ./keys/UNIA_app.key ./keys/$usuario.key --query $palabra
		;;

		5)
		
			echo "Introduce el nombre del fichero: "
			read fichero
			echo "Introduce el nombre del fichero destino: "
			read fich_destino

			python ./scripts/tweet_streaming.py keys/UNIA_app.key ./keys/$usuario.key ./$fich_destino --words datos/$fichero

		;;
	esac
done


		

	
