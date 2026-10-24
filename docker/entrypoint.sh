#!/bin/sh
set -e

mkdir -p /run/php /var/log/nginx /var/www/books-yii

php-fpm --daemonize
exec nginx -g 'daemon off;'
