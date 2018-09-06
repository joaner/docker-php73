# docker-php73
docker image for php 7.3 based centos7

## install

```bash
wget https://downloads.php.net/~cmb/php-7.3.0beta3.tar.gz
docker build -t php:7.3.0beta3 --build-arg "PHP_VERSION=7.3.0beta3" --memory-swap="-1" --memory="2G" .
docker run -d -v /srv/log:/usr/local/var/log -v /srv/www:/usr/local/www -p 9000:9000 php:7.3.0beta3
```

## more memory
https://blog.csdn.net/taiyang1987912/article/details/41695895

