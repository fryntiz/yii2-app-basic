#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

create_tags() {
    ## Genera las etiquetas en github
    ghi label minimum -c e99695             ## Mínimo
    ghi label important -c mediumpurple     ## Importante
    ghi label optional -c fef2c0            ## Opcional

    ghi label easy -c f9ca98                ## Fácil
    ghi label medium -c 93d8d7              ## Medio
    ghi label difficult -c b60205           ## Difícil

    ghi label query -c d4c5f9               ## Consulta
    ghi label suggestion -c 006b75          ## Sugerencia
    ghi label feature -c 0052cc             ## Caracteríestica nueva
    ghi label bug -c ff0000                 ## FALLO

    ghi label help -c 00ff00                ## Necesito ayuda
}

create_tags
