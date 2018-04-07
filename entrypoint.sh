#!/bin/bash 

PORT=${PORT:-80}
sed -r -i "s@(.*listen.*)80(.*)@\1${PORT}\2@g" /etc/nginx/nginx.conf
exec "$@"

