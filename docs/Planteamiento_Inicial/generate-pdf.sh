#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

BASE_DIR="$(dirname $(readlink -f "$0"))"
PROYECTO_DIR="$BASE_DIR/../.."

generar_planteamiento() {
    pandoc -s planteamiento.md requisitos.md -o planteamiento_tmp.adoc
}

## Reemplazar archivo generado
reemplazar() {

    echo ":lang: es\n:toc:\n:toc-title: Tabla de contenidos\n:sectnums:\n\n" | cat - pro.adoc > planteamiento_tmp.adoc

    S[1]='\[cols=">,<",options="header",\]'
    S[2]='\[width="100%",cols=">43%,<57%",options="header",\]'
    S[3]='\[width="51%".*'

    for p in ${S[*]}
    do
        sed -i 's/^'$p'$/\[width="100%",cols=">20%,<80%",options="header",\]/' planteamiento_tmp.adoc
    done

    sed -i 's/^\[width="[2-9].*$/\[cols="<3%,^,^,^,^",options="header",\]/' planteamiento_tmp.adoc
}

generar_pdf() {
    asciidoctor-pdf planteamiento_tmp.adoc
}

limpiar_tmp() {
    rm -f pro.adoc planteamiento_tmp.adoc

}

generar_planteamiento
reemplazar
generar_pdf
limpiar_tmp
