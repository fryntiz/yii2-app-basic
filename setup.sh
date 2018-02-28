#!/bin/sh

DIR=$(basename $(realpath .))

sed -i s/proyecto/$DIR/g db/* config/* proyecto.conf codeception.yml
mv proyecto.conf $DIR.conf
mv db/proyecto.sql db/$DIR.sql
mv tests/_data/proyecto.sql tests/_data/$DIR.sql
ln -sf ../../db/$DIR.sql tests/_data/$DIR.sql
rm -f $0
