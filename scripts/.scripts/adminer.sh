#!/bin/sh
doas systemctl start mariadb
php -S 127.0.0.1:8080 -t ~/.scripts/adminer/
