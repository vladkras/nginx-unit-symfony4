FROM vladkras/nginx-unit-php7

ENV INSTALL_PATH=/symfony SYMFONY_VERSION="4.0.*"

RUN apk add --update --no-cache \
	php7-ctype \
	php7-dom \
	php7-xml \
	php7-json \
	php7-phar \
	php7-mbstring \
	php7-zlib \
	php7-openssl \
	php7-iconv \
	php7-session

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -s /bin/sh -G www-data www-data

COPY config.json /config.json

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
