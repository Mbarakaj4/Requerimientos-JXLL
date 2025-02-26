#!/bin/bash

# Colores
LIMPIAR='\e[0m'
ROJO='\e[31m'
CELESTE='\e[36m'
VERDE='\e[32m'

# Banner
BANNER=$(cat ./banners/banner_jxll.txt)
echo -e "$ROJO ================================================ $LIMPIAR"
echo -e "$CELESTE $BANNER \n"
echo 'Dependency installer v1.0.0'
echo -e "$ROJO ================================================ $LIMPIAR"

# Preparacion
DIRECTORIOJXLL="$HOME/teamjxll"
echo 'Actualizando el sistema'
pkg update & pkg upgrade -y &> /dev/null
termux-setup-storage

# Instalacion
echo 'Instalando lenguajes de programacion...'
pkg install python ruby php -y &> /dev/null
echo 'Instalando librerias...'
pkg install curl wget openssh openssl grep -y &> /dev/null
echo 'Instalando apps...'
pkg install tor w3m -y &> /dev/null
echo 'Instalando Team_JXLL...'
python -m venv $DIRECTORIOJXLL &> /dev/null

echo 'Presione ENTER para continuar'
read -n 1 -s
source './JXLL_V3.sh'

