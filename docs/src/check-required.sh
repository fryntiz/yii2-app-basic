#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

ERROR='false'

check_ghi() {
    if [[ ! -x '/usr/bin/ghi' ]]; then
        echo 'Attention: La herramienta ghi no está instalada.'
        ERROR='true' && return 1
    fi

    echo 'ghi .......... Correcto!'
    return 0
}

check_vendor() {
    if [[ ! -d vendor ]]; then
        echo 'Attention: No hay directorio "vendor" (composer install)'
        ERROR='true' && return 1
    fi

    echo 'vendor .......... Correcto!'
    return 0
}

check_python() {
    if [[ ! -x '/usr/bin/python3' ]]; then
        echo 'Attention: Python 3 no está instalado.'
        ERROR='true' && return 1
    fi

    echo 'python3 .......... Correcto!'
    return 0
}

check_php() {
    if [[ ! -x '/usr/bin/php' ]]; then
        echo 'Attention: php no está instalado.'
        ERROR='true' && return 1
    fi

    echo 'php .......... Correcto!'
    return 0
}

check_ruby() {
    if [[ ! -x '/usr/bin/ruby' ]]; then
        echo 'Attention: Ruby no está instalado.'
        ERROR='true' && return 1
    fi

    echo 'ruby .......... Correcto!'
    return 0
}

check_ghi
check_vendor
check_python
check_php
check_ruby

if [[ $ERROR = 'true' ]]; then
    echo 'Se han encontrado errores, resuelve dependencias'
    exit 1
else
    echo 'Todas las dependencias satisfechas'
fi

exit 0
