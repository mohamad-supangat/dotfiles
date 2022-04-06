#!/bin/sh
doas systemctl start mariadb
php -S 127.0.0.1:1712 -t ~/.scripts/adminer/
