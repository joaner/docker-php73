FROM centos:7

EXPOSE 9000

ARG PHP_VERSION="7.3.0beta3"

ADD "php-$PHP_VERSION.tar.gz" /srv

WORKDIR "/srv/php-$PHP_VERSION"
RUN yum install -y gcc \
		libxml2-devel \
		openssl-devel \
		freetype-devel \
		libwebp-devel \
		libpng-devel \
		libjpeg-devel \
		libicu-devel \
		gcc-c++ \
		libzip-devel \
		make \
	&& ./configure --prefix=/usr/local \
		--enable-fpm \
		--with-openssl \
		--with-zlib \
		--enable-ftp \
		--with-gd \
		--with-webp-dir \
		--with-jpeg-dir \
		--with-png-dir \
		--with-zlib-dir \
		--with-freetype-dir \
		--enable-intl \
		--enable-mbstring \
		--enable-pcntl \
		--with-pdo-mysql \
		--enable-sockets \
	&& make \
	&& make install \
	&& make clean

WORKDIR /usr/local
ADD conf/php.ini lib/php.ini
ADD conf/php-fpm.conf etc/php-fpm.conf
ADD conf/php-fpm.d/www.conf etc/php-fpm.d/www.conf

CMD [ "/usr/local/sbin/php-fpm", "-F", "-y", "/usr/local/etc/php-fpm.conf", "-c", "/usr/local/lib/php.ini" ]
