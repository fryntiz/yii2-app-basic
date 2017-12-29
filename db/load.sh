#!/bin/sh

BASE_DIR=$(dirname $(readlink -f "$0"))
if [ "$1" != "test" ]
then
    psql -h localhost -U proyecto -d proyecto < $BASE_DIR/proyecto.sql
fi
psql -h localhost -U proyecto -d proyecto_test < $BASE_DIR/proyecto.sql
