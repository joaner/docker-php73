FROM centos:7

EXPOSE 9000

ADD php-7.3.0beta3.tar.gz /srv

WORKDIR /srv
RUN mkdir www log

WORKDIR /srv/php-7.3.0beta3
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
	make
RUN ./configure --perfix=/usr/local \
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
	--enable-sockets

RUN make && make install
RUN cp php.ini-production /usr/local/lib/php.ini

WORKDIR /usr/local
RUN cp etc/php-fpm.conf.default etc/php-fpm.conf
RUN cp etc/php-fpm.d/www.conf.default etc/php-fpm.d/www.conf

CMD [ "/usr/local/sbin/php-fpm", "-F", "-y", "/usr/local/etc/php-fpm.conf", "-c", "/usr/local/lib/php.ini" ]
