#!/bin/bash

. ~/iOSProjects/DictEnEsScript/functions/funciones.sh

while [ "$*" == "" ]
do
    printTitle
    read palabra
    echo ""
    prueba-palabra-ingles $palabra
    if [ "$?" = 0 ]
    then
    #=================================
        if [[ -z $palabra ]];
        then
            echo "User pressed ENTER with no input text, i will reproduce last word found ...";
            reproduce-audio $INGLES
        else
            echo -e "$BLANCO exist $ROSA $palabra $BLANCO in english data base"
            prueba-palabra-audio $palabra
            if [ "$?" = 0 ]
            then
                reproduce-audio $palabra
                sleep 1
            else
                echo -e "$AMARILLO audio does not exist ... It will search on google"
                descargar-mp3-google $palabra
                echo -e "$AMARILLO It does exist ... converting to wav"
                convierte-mp3-wav $palabra
                echo -e "$AMARILLO reproducing audio"
                reproduce-audio $palabra
                sleep 1
            fi
            limpiar-archivo-ingles $palabra
            clear
            desplegar-traduccion-ingles $palabra
        fi
    #=================================
    else
    #=================================
        echo -e "$ROSA $palabra $BLANCO does not exist in english data base .... It will search on spanish data base"
        prueba-palabra-espanol $palabra
        if [ "$?" = 0 ]
        then
            existe-archivo-en-espanol $palabra
            clear
            desplegar-traduccion-espanol $palabra
            reproduce-audio $INGLES
        else
            buscar-palabra-en-google $palabra
            sleep 1
            prueba-palabra-audio $ingles
            sleep 1
            if [ "$?" = 0 ]
            then
                reproduce-audio $ingles
                sleep 1
            else
                descargar-audio-de-google $ingles
                sleep 1
            fi
            clear
            despliega-opcion-agregar-palabra
            read decision
            despliega-menu-de-decision
        fi
        #==================================
    fi
done
