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
echo 'Remove team jxll from your system'
echo -e "$ROJO ================================================ $LIMPIAR"

# Preparacion
DIRECTORIOJXLL="$HOME/teamjxll"

# Desinstalacion
rm -r $DIRECTORIOJXLL
pkg uninstall python ruby php \
    curl wget openssh openssl grep \
    tor w3m cmatrix -y

# Post-Desinstalacion
echo -e "$ROJO
Lastimosamente el banner solo se puede remover manualmente.
edite o restaure su archivo .bashrc ubicado en ~/.bashrc
$LIMPIAR"
echo 'Presione ENTER para continuar'
read -n 1 -s
source './JXLL_V3.sh'