#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

crear_hitos() {
    if ! ghi milestone > /dev/null 2>&1; then
    echo 'No hay repositorio asociado en GitHub.'
    echo 'Crea primero un repositorio y vincúlalo con éste.'
    exit 1
    fi

    ## Crear HITOS AQUI

    GHI="$(ghi milestone | grep -v ^\# | cut -c3-)"
    ERROR='false'

    for p in "1: v0.1.0" "2: v0.2.0" "3: v0.3.0"; do
        if ! echo $GHI | grep -qs "$p"; then
            echo "El hito (milestone) $p falta o está mal creado."
            ERROR="true"
        fi
    done

    if [[ "$ERROR" = 'true' ]]; then
        REPO="$(ghi milestone -w)"
        echo "Crea en $REPO los hitos v0.1.0, v0.2.0 y v0.3.0 (en ese orden)"
        echo "Si ya estaban creados, elimínalos primero antes de crearlos."
        exit 1
    fi
}

crear_hitos

exit 0
