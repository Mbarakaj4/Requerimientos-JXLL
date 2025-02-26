# Colores
LIMPIAR='\e[0m'
ROJO='\e[31m'
CELESTE='\e[36m'
VERDE='\e[32m'

# Textos
opciones=('salir' 'instalar paquetes de termux' 'instalar banners' 'instalar efecto matrix')

# Banner
BANNER=$(cat ./banners/banner_jxll.txt)
echo -e "$ROJO ================================================ $LIMPIAR"
echo -e "$CELESTE $BANNER \n"
echo -e "$ROJO ================================================ $LIMPIAR"
for index in 1 2 3 0
do
    lista_ordenada=$(echo -e "$CELESTE [ $LIMPIAR $ROJO $index $LIMPIAR $CELESTE ] $LIMPIAR" |
     tr -d '[:blank:]')
    echo -e $lista_ordenada "$VERDE ${opciones[$index]} $LIMPIAR"
done