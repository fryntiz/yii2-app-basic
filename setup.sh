#!/bin/sh

DIR=$(basename $(realpath .))

sed -i s/proyecto/$DIR/g db/* config/* proyecto.conf
mv db/proyecto.sql db/$DIR.sql
mv proyecto.conf $DIR.conf
rm -f $0
