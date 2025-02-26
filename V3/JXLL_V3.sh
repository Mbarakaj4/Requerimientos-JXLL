#!/bin/bash

# Colores
LIMPIAR='\e[0m'
ROJO='\e[31m'
CELESTE='\e[36m'
VERDE='\e[32m'

# Textos
opciones=('Salir' 'Instalar paquetes de termux' 'Instalar banners'
 'Instalar efecto matrix' 'Desinstalar todo')

# Banner
BANNER=$(cat ./banners/banner_jxll.txt)
echo -e "$ROJO ================================================ $LIMPIAR"
echo -e "$CELESTE $BANNER \n"
echo -e "$ROJO ================================================ $LIMPIAR"

# Opciones
for index in 1 2 3 4 0
do
    lista_ordenada=$(echo -e "$CELESTE [ $LIMPIAR $ROJO $index $LIMPIAR $CELESTE ] $LIMPIAR" |
     tr -d '[:blank:]')
    echo -e $lista_ordenada "$VERDE ${opciones[$index]} $LIMPIAR"
done

# Manejo de la respuesta del usuario
echo -n ">>> "
read -r opcion
case $opcion in
    1)
     source "./modules/termux_dependencies.sh"
     clear
    ;;
    2)
     source "./modules/banner_installer.sh"
     clear
    ;;
    3)
     source "./modules/matrix_installer.sh"
     clear
    ;;
    4)
     source "./modules/uninstaller.sh"
     clear
    ;;
    0)
     clear
     exit
    ;;
esac