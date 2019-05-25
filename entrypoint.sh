#!/bin/sh
set -e

mkdir -p $INSTALL_PATH && chown -R www-data:www-data $INSTALL_PATH

echo "Installing Symfony (be patient)..."

su - www-data -c "composer -vv create-project symfony/skeleton $INSTALL_PATH $SYMFONY_VERSION"

/opt/unit/sbin/unitd --control unix:/var/run/control.unit.sock --modules $DESTDIR"modules" --user www-data --group www-data

curl -X PUT -d @/config.json --unix-socket /run/control.unit.sock http://localhost/config/

tail -f /var/log/unitd.log
