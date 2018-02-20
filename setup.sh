#!/bin/sh

DIR=$(basename $(realpath .))

sed -i s/proyecto/$DIR/g db/* config/* proyecto.conf codeception.yml
mv db/proyecto.sql db/$DIR.sql
mv tests/_data/proyecto.sql tests/_data/$DIR.sql
mv proyecto.conf $DIR.conf
rm -f $0
