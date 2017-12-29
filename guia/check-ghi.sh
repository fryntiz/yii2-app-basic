#!/bin/sh

if [ ! -x /usr/local/bin/ghi ]
then
    echo "Error: falta el programa ghi."
    exit 1
fi

if ! ghi milestone > /dev/null 2>&1
then
    echo "No hay repositorio asociado en GitHub."
    echo "Crea primero un repositorio y vincúlalo con éste."
    exit 1
fi

GHI=$(ghi milestone | grep -v ^\# | cut -c3-)
OK="1"

for p in "1: v1" "2: v2" "3: v3"
do
    if ! echo $GHI | grep -qs "$p"
    then
        echo "El hito (milestone) $p falta o está mal creado."
        OK="0"
    fi
done

if [ "$OK" = "0" ]
then
    REPO=$(ghi milestone -w)
    echo "Crea en $REPO los hitos v1, v2 y v3 (en ese orden), para que sus"
    echo "números internos coincidan con 1, 2 y 3, respectivamente."
    echo "Si ya estaban creados, elimínalos primero antes de crearlos."
    exit 1
fi
