#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

## Si no recibe ningún parámetro, renueva toda la documentación
## Puede recibir uno de estos dos parámetros opcionales:
## -a Genera documentación para la API
## -g Genera documentación para la guía

BASE_DIR="$(dirname $(readlink -f "$0"))"
PROYECTO_DIR="$BASE_DIR/../.."
DOCS_DIR="$PROYECTO_DIR/docs"
SRC_DIR="$DOCS_DIR/src"

api() {
    $PROYECTO_DIR/vendor/bin/apidoc api \
    .,$PROYECTO_DIR/vendor/yiisoft/yii2 "$DOCS_DIR/api" \
        --pageTitle="API del proyecto" --guide=.. --guidePrefix= \
        --exclude="docs,vendor,tests" --interactive=0 \
        --template="project" \
        --readmeUrl="file://$BASE_DIR/README-api.md"
}

guide() {
    $PROYECTO_DIR/vendor/bin/apidoc guide "$SRC_DIR" "$DOCS_DIR" \
        --pageTitle="Objetivos del proyecto" --guidePrefix= --apiDocs=./api \
        --interactive=0 --template="project"
    mv "README.html" "index.html"
    ln -sf "src/index.html" "README.html"
    rm "$DOCS_DIR/README-api.html"
}

DIR_ACTUAL="$PWD"

cd $DOCS_DIR || exit

if [[ "$1" = '-a' ]]; then
    if [[ -d 'api' ]]; then
        rm -rf 'api'
    fi

    api
elif [[ "$1" = '-g' ]]; then
    find . -maxdepth 1 \
        -not -name '.' \
        -not -name '..' \
        -not -name 'api' \
        -not -name 'src' \
        -not -name 'Planteamiento_Inicial' \
        -not -name '.gitignore' \
        -exec rm -Rf {} \;
    guide
else
    #find docs -not -path 'docs' -not -name ".gitignore" -exec rm -Rf {} \;
    find . -maxdepth 1 \
        -not -name '.' \
        -not -name '..' \
        -not -name 'src' \
        -not -name 'Planteamiento_Inicial' \
        -not -name '.gitignore' \
        -exec rm -Rf {} \;
    api
    guide
fi

touch $DOCS_DIR/.nojekyll

cd $DIR_ACTUAL || exit
