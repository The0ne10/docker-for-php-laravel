FROM php:8.2-fpm-alpine

RUN mkdir -p /var/www/laravel
RUN docker-php-ext-install pdo pdo_mysql \
    && apk add --update linux-headers \
    && apk add nodejs && apk add npm \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-3.3.1 \
    && docker-php-ext-enable xdebug

# Вариант 1
# RUN adduser -D user && chown -R user /var/www/laravel
# USER user

# Вариант 2
# RUN mkdir -p /var/www/laravel
# RUN adduser -S -D user -u 1000
# По необходимости сделать chown -R user /var/www/laravel

WORKDIR /var/www/laravel
