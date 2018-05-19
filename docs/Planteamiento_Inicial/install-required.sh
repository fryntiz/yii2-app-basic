#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

instalar_ruby() {
    LISTA=$(gem list --local)

    for p in asciidoctor asciidoctor-pdf
    do
        if ! echo $LISTA | grep -qs "$p "
        then
            echo "Instalando $p..."
            sudo gem install $p --pre
        fi
    done
}

instalar_python() {
    sudo apt install -f python3 pip3
}

instalar_php() {
    sudo apt install -f php
}

instalar_composer() {
    sudo apt install -f composer
}

instalar_ghi() {
    sudo apt install -f ghi
}

instalar_ruby
instalar_python
instalar_php
instalar_composer
instalar_ghi
