#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

if ! dpkg -s pandoc > /dev/null 2>&1
then
    echo "Instalando Pandoc $VER..."
    sudo apt install -y pandoc
fi

LISTA=$(gem list --local)

for p in asciidoctor asciidoctor-pdf
do
    if ! echo $LISTA | grep -qs "$p "
    then
        echo "Instalando $p..."
        sudo gem install $p --pre
    fi
done
