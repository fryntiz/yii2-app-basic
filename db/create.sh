#!/bin/sh

if [ "$1" = "travis" ]
then
    psql -U postgres -c "CREATE DATABASE proyecto_test;"
    psql -U postgres -c "CREATE USER proyecto PASSWORD 'proyecto' SUPERUSER;"
else
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists proyecto
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists proyecto_test
    [ "$1" != "test" ] && sudo -u postgres dropuser --if-exists proyecto
    sudo -u postgres psql -c "CREATE USER proyecto PASSWORD 'proyecto' SUPERUSER;"
    [ "$1" != "test" ] && sudo -u postgres createdb -O proyecto proyecto
    sudo -u postgres createdb -O proyecto proyecto_test
    LINE="localhost:5432:*:proyecto:proyecto"
    FILE=~/.pgpass
    if [ ! -f $FILE ]
    then
        touch $FILE
        chmod 600 $FILE
    fi
    if ! grep -qsF "$LINE" $FILE
    then
        echo "$LINE" >> $FILE
    fi
fi
