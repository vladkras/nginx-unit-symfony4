#!/bin/sh
set -e

mkdir -p $INSTALL_PATH && chown -R www-data:www-data $INSTALL_PATH

sudo -u www-data composer create-project symfony/skeleton $INSTALL_PATH $SYMFONY_VERSION

/opt/unit/sbin/unitd --control unix:/var/run/control.unit.sock --modules $DESTDIR"build" --user www-data --group www-data

curl -X PUT -d @/config.json --unix-socket /run/control.unit.sock http://localhost/

tail -f /var/log/unitd.log
