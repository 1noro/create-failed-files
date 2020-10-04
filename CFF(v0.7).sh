#!/bin/bash
#Create Failed Files (CFF)
#(c) INO 2013
#Idioma (Castellano)

# █

###Asignación de variables por defecto

version='0.4'
name='x'
ex='x'
tx='x'

###Intro/Salida

function entrying {
	clear
	echo
	echo '                ██████████████████'
	echo '   ███████    ███'
	echo '   ███      █   ███     ██████████'
	echo '███           █████   ███'
	echo '  ██            ███     ███'
	echo '███           ███     █████'
	echo '   ███      █   ███     ███'
	echo '   ███████    ███     ███ (3)1197'
	echo
	sleep 1
	clear
	echo
	echo '               ██████████████████'
	echo '    ███████    ███'
	echo '  ███      █   ███     ██████████'
	echo ' ███           █████   ███'
	echo ' ██            ███     ███'
	echo ' ███           ███     █████'
	echo '  ███      █   ███     ███'
	echo '    ███████    ███     ███ (C)INO'
	echo
	sleep 1
	ini
}

function exiting {
	clear
	echo
	echo '               ██████████████████'
	echo '    ███████    ███'
	echo '  ███      █   ███     ██████████'
	echo ' ███           █████   ███'
	echo ' ██            ███     ███'
	echo ' ███           ███     █████'
	echo '  ███      █   ███     ███'
	echo '    ███████    ███     ███ (C)INO'
	echo
	sleep 1
	clear
	echo
	echo '                ██████████████████'
	echo '   ███████    ███'
	echo '   ███      █   ███     ██████████'
	echo '███           █████   ███'
	echo '  ██            ███     ███'
	echo '███           ███     █████'
	echo '   ███      █   ███     ███'
	echo '   ███████    ███     ███ (3)1197'
	echo
	sleep 1
	exit
}

###Menu de inicio

function ini {
	clear
	tput setf 4
	echo '                                     [x]'
	tput setf 9
	echo '    -Create Failed Files v'"$version"'-'
	echo
	echo '   ┌───┬──────────────────────┐'
	echo '   │ 1 │Creación rapida       │'
	echo '   ├───┼──────────────────────┤'
	echo '   │ 2 │Creación personalizada│'
	echo '   ├───┼──────────────────────┤'
	echo '   │ 3 │Creación guiada       │'
	echo '   ├───┼──────────────────────┤'
	echo '   │ l │Lista de extensiones  │'
	echo '   ├───┼──────────────────────┤'	
	echo '   │ x │Salir                 │'
	echo '   └───┴──────────────────────┘'
	echo
	read -p ">> " ini
	if [[ "$ini" = 1 ]]; then
		create-r
	elif [[ "$ini" = 2 ]]; then
		create-p
	elif [[ "$ini" = 3 ]]; then
		create-g
	elif [[ "$ini" = l ]]; then
		list
	elif [[ "$ini" = x ]]; then
		salir
	else
		ini
	fi
}

###Salir

function salir {
	tput setf 4
	echo '>> Estas seguro de que quieres salir? (s/n)'
	tput setf 9
	read -p ">> " ini
	if [[ "$ini" = s ]]; then
		exiting
	elif [[ "$ini" = n ]]; then
		ini
	elif [[ "$ini" = x ]]; then
		ini
	else
		salir
	fi
}

###Lista de extensiones

function list {
	clear
	tput setf 6
	echo '                                     [x]'
	tput setf 9
	echo '-Ejemplos de extensiones-'
	echo
	cat l.txt
	echo
	echo
	echo '>> Pulsa intro para volver'
	read ini
	if [[ "$ini" = 'x' ]]; then
		ini
	elif [[ "$ini" = '+' ]]; then
		add-ex
	else
		ini
	fi
}

function add-ex {
	tput setf 3
	read -p "Nuevo ejemplo>> " nex
	read -p "Es correcto? (s/n)>> " ini
	if [[ "$ini" = s ]]; then
		echo "$nex" >> l.txt
		list
	elif [[ "$ini" = n ]]; then
		list
	elif [[ "$ini" = x ]]; then
		ini
	else
		list
	fi
}

###Creación rapida

function create-r {
	tput setf 3
	read -p "Nombre>> " name
	name2="$name"'.'
	read  -p "$name2" ex
	create-r-2
}

function create-r-2 {
	read -p "Crear? (s/n)>> " ini
	if [[ "$ini" = s ]]; then
		form-r
	elif [[ "$ini" = n ]]; then
		ini
	elif [[ "$ini" = x ]]; then
		ini
	else
		create-r-2
	fi
}

function form-r {
	#                                                                                      A RG
	echo 'Error: Failed to save the document' "$name"'.'"$ex"', the file is broken. (error 1197)' >> "$name"'.'"$ex"
	echo 'Try to open the document in the original computer' >> "$name"'.'"$ex"
	echo '>> El archivo' "$name"'.'"$ex" 'fue creado con exito'
	sleep 2
	ini
}

###Creación personalizada

function create-p {
	clear
	tput setf 6
	echo '                                     [x]'
	tput setf 3
	echo '-Creación Personalizada-'
	echo
	read  -p "Nombre>> " name
	name2="$name"'.'
	read  -p "$name2" ex
	read  -p "Texto>> " tx
	create-p-2
}

function create-p-2 {
	read -p "Crear? (s/n)>> " ini
	if [[ "$ini" = s ]]; then
		form-p
	elif [[ "$ini" = n ]]; then
		ini
	elif [[ "$ini" = x ]]; then
		ini
	else
		create-p-2
	fi
}

function form-p {
	echo "$tx" >> "$name"'.'"$ex"
	#            A RG
	echo '(error 1197)' >> "$name"'.'"$ex"
	echo '>> El archivo' "$name"'.'"$ex" 'fue creado con exito'
	sleep 2
	ini
}

###Creación guiada

function create-g {
	clear
	tput setf 6
	echo '                                     [x]'
	tput setf 3
	echo '-Creación Guiada-'
	echo
	sleep 2
	echo '>> Vamos a iniciar la creación guiada'
	echo 'de un documento roto o fallido'
	sleep 3
	echo '>> Esta gia le ayudará a conocer el uso'
	echo 'de las demás funciones de este programa'
	sleep 3
	echo '>> Empezamos:'
	sleep 1
	echo '>> Introduzca el nombre del archivo que'
	echo 'quiere crear'
	sleep 3
	tput setf 9
	read  -p "Nombre>> " name
	tput setf 3
	name2="$name"'.'
	echo '>> Bien, si te has equivocado no pasa'
	echo 'nada, mas adelante podrás rectificar'
	sleep 2
	echo '>> Ahora escrive la terminación de tu'
	echo 'nuevo archivo roto'
	sleep 3
	echo '>> Si quieres que sea mas creible'
	echo 'pudes buscar una terminación existente'
	echo 'en la lista de extensiones del inicio'
	sleep 4
	tput setf 9
	read  -p "$name2" ex
	tput setf 3
	echo '>> Ahora sol queda escrivir el texto'
	echo 'que aparecerá en caso de que intenten'
	echo 'abrir el archivo con el bloc de notas'
	sleep 3
	echo '>> Te recomiendo (para que sea creible)'
	echo 'que esté escrito en ingles, pero eso es'
	echo 'decisión tulla'
	sleep 2
	tput setf 9
	read  -p "Texto>> " tx
	tput setf 3
	create-g-2
}

function create-g-2 {
	echo '>> Este es el momento de rectificar,'
	echo 'si te has equivocado introduce (n), o'
	echo 'de lo contrario, si quieres crear el'
	echo 'archivo introduce (s)'
	tput setf 9
	read -p "Crear? (s/n)>> " ini
	tput setf 3
	if [[ "$ini" = s ]]; then
		form-g
	elif [[ "$ini" = n ]]; then
		ini
	elif [[ "$ini" = x ]]; then
		ini
	else
		create-g-2
	fi
}

function form-g {
	echo "$tx" >> "$name"'.'"$ex"
	#            A RG
	echo '(error 1197)' >> "$name"'.'"$ex"
	echo '>> El archivo' "$name"'.'"$ex" 'fue creado con exito'
	sleep 1
	echo '>> Muchas gracias por usar esta guia del'
	echo 'programa CFF v'"$version"
	sleep 2
	echo '>> Venga, hasta luego'
	sleep 4
	ini
}

entrying
