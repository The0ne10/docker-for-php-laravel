FROM php:8.2-fpm-alpine

RUN mkdir -p /var/www/
RUN docker-php-ext-install pdo pdo_mysql \
    && apk add --update linux-headers \
    && apk add nodejs && apk add npm \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-3.3.1 \
    && docker-php-ext-enable xdebug


RUN adduser -D user && chown -R user /var/www/
USER user

WORKDIR /var/www/
