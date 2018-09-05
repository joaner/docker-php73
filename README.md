# docker-php73
docker image for php 7.3 based centos7

## install
docker build -t php:v5 --memory-swap="-1" --memory="5G" --no-cache .

NOTE that /usr/local/etc/php-fpm.conf has err

## more memory
https://blog.csdn.net/taiyang1987912/article/details/41695895

