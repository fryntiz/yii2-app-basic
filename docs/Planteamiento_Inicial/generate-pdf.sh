#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

BASE_DIR="$(dirname $(readlink -f "$0"))"
PROYECTO_DIR="$BASE_DIR/../.."

## Actualizar requisitos
generar_requisitos() {
    php requisitos.php
}

generar_planteamiento() {
    pandoc -s planteamiento.md requisitos.md -o planteamiento_tmp.adoc
}

## Reemplazar archivo generado
reemplazar() {

    echo ":lang: es\n:toc:\n:toc-title: Tabla de contenidos\n:sectnums:\n\n" | cat - planteamiento_tmp.adoc > planteamiento.adoc

    S[1]='\[cols=">,<",options="header",\]'
    S[2]='\[width="100%",cols=">43%,<57%",options="header",\]'
    S[3]='\[width="51%".*'

    for p in ${S[*]}
    do
        sed -i 's/^'$p'$/\[width="100%",cols=">20%,<80%",options="header",\]/' planteamiento.adoc
    done

    sed -i 's/^\[width="[2-9].*$/\[cols="<3%,^,^,^,^",options="header",\]/' planteamiento.adoc
}

generar_pdf() {
    asciidoctor-pdf planteamiento.adocW
}

limpiar_tmp() {
    rm -f pro.adoc planteamiento.adoc

}

#generate_pdf(){
generar_planteamiento
reemplazar
generar_pdf
limpiar_tmp

#}
