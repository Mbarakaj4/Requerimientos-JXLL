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
echo 'CMatrix installer v1.0.0'
echo -e "$ROJO ================================================ $LIMPIAR"

# Preparacion
pkg update
pkg upgrade -y

# Instalacion
pkg install cmatrix

# Post-Instalacion
echo 'Presione ENTER para continuar'
read -n 1 -s
source './JXLL_V3.sh'