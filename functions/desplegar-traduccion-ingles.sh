#!/bin/bash

desplegar-traduccion-ingles()
{
    palabra=$1
    n=`cuenta-lineas-archivo-ingles $palabra`
    echo -e "$BLANCO Existen $n significados de la palabra $palabra"
    # hace una accion desde i hasta n
    for index in `seq $n`	
    do
        obtener-campos-ingles $palabra $index
        imprimir-campos-ingles
    done
}

