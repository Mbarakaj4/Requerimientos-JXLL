#!/bin/bash

# Colores
RED='\e[31m'
CYAN='\e[36m'
GREEN='\e[32m'
NC='\e[0m'

# Banner
BANNER=$(cat ./banners/banner_jxll.txt)
echo -e "$RED ================================================ $NC"
echo -e "$CYAN $BANNER \n"
echo 'Banner installer v1.0.0'
echo -e "$RED ================================================ $NC"

# PREPARACION (By AvastrOficial)
# Función para instalar dependencias
instalar_dependencias() {
    RED='\e[31m'
    GREEN='\e[32m'
    CYAN='\e[36m'
    NC='\e[0m'

    echo -e "${CYAN}Comprobando dependencias...${NC}"

    # Verificar si estamos en Termux
    if command -v pkg &> /dev/null; then
        gestor_paquete="pkg"
    elif command -v apt &> /dev/null; then
        gestor_paquete="apt"
    else
        echo -e "${RED}No se encontró un gestor de paquetes compatible (pkg/apt). Instale 'jp2a' o 'imagemagick' manualmente.${NC}"
        exit 1
    fi

    # Verificar si jp2a está instalado, si no, instalarlo
    if ! command -v jp2a &> /dev/null; then
        echo -e "${RED}No se encontró 'jp2a'. Instalando...${NC}"
        $gestor_paquete install jp2a -y
    fi

    # Verificar si ImageMagick está instalado, si no, instalarlo
    if ! command -v convert &> /dev/null; then
        echo -e "${RED}No se encontró 'convert'. Instalando ImageMagick...${NC}"
        $gestor_paquete install imagemagick -y
    fi

    echo -e "${GREEN}Dependencias instaladas correctamente.${NC}"
}

# Función para convertir imagen a ASCII
convertir_ascii() {
    RED='\e[31m'
    CYAN='\e[36m'
    GREEN='\e[32m'
    NC='\e[0m'

    echo -e "${CYAN}Ingrese la URL de la imagen: ${NC}"
    read URL

    IMG_NAME="imagen_temp.jpg"
    ASCII_FILE="$HOME/.termux_banner"

    echo -e "${GREEN}Descargando imagen...${NC}"
    curl -s -o $IMG_NAME "$URL"

    # Verificar si la imagen se descargó correctamente
    if [ ! -f "$IMG_NAME" ]; then
        echo -e "${RED}Error al descargar la imagen.${NC}"
        exit 1
    fi

    # Verificar si jp2a está instalado
    if command -v jp2a &> /dev/null; then
        echo -e "${GREEN}Convirtiendo imagen a ASCII con jp2a...${NC}"
        jp2a --width=50 "$IMG_NAME" > "$ASCII_FILE"
    # Si no está instalado, verificar si ImageMagick está disponible
    elif command -v convert &> /dev/null; then
        echo -e "${GREEN}Convirtiendo imagen con ImageMagick...${NC}"
        convert "$IMG_NAME" -resize 100x100! txt:- | awk 'NR>1 {print $0}' > "$ASCII_FILE"
    else
        # Si ninguno de los comandos está instalado, mostrar un error
        echo -e "${RED}Error: No se encontró 'jp2a' ni 'convert'. Instale uno de ellos.${NC}"
        exit 1
    fi

    # Verificar si ya se ha configurado el banner en .bashrc
    if ! grep -q "cat $ASCII_FILE" ~/.bashrc; then
        echo -e "${GREEN}Configurando banner en Termux...${NC}"
        echo "clear" >> ~/.bashrc
        echo "cat $ASCII_FILE" >> ~/.bashrc
    fi

    echo -e "${GREEN}¡Banner configurado! Reinicia Termux para ver los cambios.${NC}"

    # Eliminar la imagen temporal después de usarla
    rm -f "$IMG_NAME"
}

# Instalacion
instalar_dependencias
convertir_ascii
echo 'Presione ENTER para continuar'
read -n 1 -s
source './JXLL_V3.sh'