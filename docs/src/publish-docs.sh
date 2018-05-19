#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

## Si no recibe ningún parámetro, renueva toda la documentación
## Puede recibir uno de estos dos parámetros opcionales:
## -a
## -g


BASE_DIR="$(dirname $(readlink -f "$0"))"

api() {
    vendor/bin/apidoc api .,vendor/yiisoft/yii2 docs/api \
        --pageTitle="API del proyecto" --guide=.. --guidePrefix= \
        --exclude="docs,vendor,tests" --interactive=0 \
        --template="project" \
        --readmeUrl="file://$BASE_DIR/README-api.md"
}

guide() {
    vendor/bin/apidoc guide 'docs-src' docs \
        --pageTitle="Objetivos del proyecto" --guidePrefix= --apiDocs=./api \
        --interactive=0 --template="project"
    mv docs/README.html docs/index.html
    ln -sf index.html docs/README.html
    rm docs/README-api.html
}

ACTUAL="$PWD"

cd $BASE_DIR/.. || exit

if [[ "$1" = '-a' ]]; then
    if [[ -d 'api' ]]; then
        rm -rf 'api'
    fi

    api
elif [[ "$1" = '-g' ]]; then
    find . -maxdepth 1 \
        -not -name 'api' \
        -not -name 'src' \
        -not -name 'Planteamiento_Inicial' \
        -delete
    guide
else
    #find docs -not -path 'docs' -not -name ".gitignore" -exec rm -Rf {} \;
    find . -maxdepth 1 \
        -not -name 'src' \
        -not -name 'Planteamiento_Inicial' \
        -delete
    api
    guide
fi

touch 'docs/.nojekyll'

cd $ACTUAL || exit
