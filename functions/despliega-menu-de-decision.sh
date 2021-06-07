#!/bin/bash

despliega-menu-de-decision()
{
    case $decision in 
    "yes")  echo ""
            echo "Se agregara a palabra: ..."
            agregar-palabra $espanol $ingles ;;
    "no") 	echo ""
    		echo "dijiste NO" ;;
    "add3") ~carlossantiagocruz/iOSProjects/DictEnEsScript/add3;; 
    *) 	    echo "tecleaste ENTER"
    		echo "" 
            ;;
    esac
}

