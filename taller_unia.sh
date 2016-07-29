#Copyright 2016 Almudena Garcia Jurado-Centurion

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

opcion=7
salir='n'

echo "Escribe tu usuario de twitter: "
read usuario

while test $salir != 's'
do

	echo "¿Que operacion desea realizar?"
	echo "1.Autentificar"
	echo "2.Obtener perfiles de usuarios"
	echo "3.Obtener tweets de usuarios"
	echo "4.Realizar busquedas en twitter"
	echo "5.Obtener tweets en tiempo real"
	echo "6.Salir"
	
	echo "Introduzca numero de opcion: "
	read opcion

	case $opcion in
		1)
			cd keys			
			python "../scripts/tweet_auth.py" "./UNIA_app.key" $usuario
			cd ..
		;;

		2)
		
			echo "Introduce el nombre del fichero: "
			read fichero

			python "./scripts/tweet_rest.py" "./keys/UNIA_app.key" "./keys/$usuario.key" "./datos/$fichero" --profile
		;;

		3)
			echo "Introduce el nombre del fichero: "
			read fichero
			
			python "./scripts/tweet_rest.py" "./keys/UNIA_app.key" "./keys/$usuario.key" "./datos/$fichero" --tweets
		;;	

		4)	
			echo "Introduce palabra a buscar: "
			read palabra

			python "./scripts/tweet_search.py" "./keys/UNIA_app.key" "./keys/$usuario.key" --query $palabra
		;;

		5)
		
			echo "Introduce el nombre del fichero: "
			read fichero
			echo "Introduce el nombre del fichero destino: "
			read fich_destino

			python "./scripts/tweet_streaming.py" "./keys/UNIA_app.key" "./keys/$usuario.key" "." $fich_destino --words "./datos/$fichero"

		;;

		6)
			salir='s'
		;;
	esac
done


		

	
