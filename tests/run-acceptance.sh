#!/bin/sh

BASE_DIR=$(dirname $(readlink -f "$0"))

if [ -f $BASE_DIR/acceptance.suite.yml ]
then
    if fuser -n tcp 8080 > /dev/null 2>&1
    then
        echo "Matando los procesos en los puertos 8080 y 9515..."
        fuser -k -n tcp 8080
        fuser -k -n tcp 9515
    fi
    if [ "$1" != "-d" ]
    then
        echo "Ejecutando chromedriver --url-base=/wd/hub ..."
        $BASE_DIR/chromedriver --url-base=/wd/hub > /dev/null 2>&1 &
        echo "Ejecutando tests/bin/yii serve ..."
        if [ "$1" = "-v" ]
        then
            $BASE_DIR/bin/yii serve &
        else
            $BASE_DIR/bin/yii serve > /dev/null 2>&1 &
        fi
    fi
fi
