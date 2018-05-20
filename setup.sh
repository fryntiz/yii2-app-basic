#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

DIR="$(basename "$(realpath .)")"

echo $DIR

#PROYECT_NAME="$(echo $DIR | tr '[:upper:]' '[:lower:]' | tr '[\-\.\ \@]' '_'
# | tr 'ñ' 'n')"
PROYECT_NAME="$(echo $DIR | tr '[:upper:]' '[:lower:]' \
                          | tr 'ñ' 'n' \
                          | tr -cs '[:alnum:]' '_')"

sed -i s/plantilla/$PROYECT_NAME/g db/* config/* apache.conf codeception.yml \
    CITATION.txt README.md LICENSE

mv 'apache.conf' "$PROYECT_NAME.conf"
mv 'db/plantilla.sql' "db/$PROYECT_NAME.sql"
mv 'db/plantilla_datos.sql' "db/$PROYECT_NAME"'_datos'.sql
mv 'tests/_data/proyecto.sql' "tests/_data/$PROYECT_NAME.sql"
ln -sf ../../db/$PROYECT_NAME.sql "tests/_data/$PROYECT_NAME.sql"
rm -f $0
