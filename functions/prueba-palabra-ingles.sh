#!/bin/bash

prueba-palabra-ingles()
{
    echo "probando palabra $1.txt"
    test -f $directorio_ingles/$1.txt
}
