#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

check_ghi() {
    if [[ ! -x '/usr/bin/ghi' ]]; then
        echo 'ghi no está instalado en el equipo'
        exit 1
    fi
}

check_pandoc() {
    if [[ ! -x '/usr/bin/pandoc' ]]; then
        echo 'pandoc no está instalado en el equipo'
        exit 1
    fi
}

check_ghi
check_pandoc

if ! ghi milestone > /dev/null 2>&1; then
    echo 'No hay repositorio asociado en GitHub.'
    echo 'Crea primero un repositorio y vincúlalo con éste.'
    exit 1
fi

GHI="$(ghi milestone | grep -v ^\# | cut -c3-)"
OK='1'

for p in "1: v0.1" "2: v0.2" "3: v0.3" "4: v0.4" "5: v0.5"; do
    if ! echo $GHI | grep -qs "$p"; then
        echo "El hito (milestone) $p falta o está mal creado."
        OK="0"
    fi
done

if [[ "$OK" = '0' ]]; then
    REPO="$(ghi milestone -w)"
    echo "Crea en $REPO los hitos v0.1, v0.2, v0.3, v0.4, v0.5 (en ese orden),
    para que sus"
    echo "números internos coincidan con 1, 2, 3... respectivamente."
    echo "Si ya estaban creados, elimínalos primero antes de crearlos."
    exit 1
fi

## Etiquetas en GitHub
ghi label query -c d4c5f9               ## Consulta
ghi label suggestion -c 006b75          ## Sugerencia
ghi label feature -c 0052cc             ## Nueva característica

ghi label optional -c fef2c0            ## Opcional
ghi label minimum -c e99695             ## Mínimo
ghi label important -c mediumpurple     ## Importante

ghi label easy -c f9ca98                ## Fácil
ghi label medium -c 93d8d7              ## Medio
ghi label difficult -c b60205           ## Difícil

ghi label help -c 00ff00                ## Ayuda


