#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

if [[ ! -d vendor ]]; then
    echo "Ejecutando composer install..."
    composer install
fi
