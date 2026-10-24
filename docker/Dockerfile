FROM php:8.3-fpm

ENV TZ=Europe/Moscow

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        nginx \
        git \
        unzip \
        libicu-dev \
        libzip-dev \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libonig-dev \
        libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql intl zip opcache gd \
    && rm -rf /var/lib/apt/lists/* /usr/local/etc/php-fpm.d/zz-docker.conf

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY php/php.ini /usr/local/etc/php/php.ini
COPY php/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

RUN sed -i 's/\r$//' /entrypoint.sh \
    && chmod +x /entrypoint.sh \
    && mkdir -p /run/php /var/log/nginx /var/www/books-yii /etc/nginx/sites-enabled

EXPOSE 80

CMD ["/entrypoint.sh"]
