FROM php:8.2-fpm

RUN mkdir -p /var/www/laravel
RUN apt-get update && apt-get install -y \
      apt-utils \
      libpq-dev \
      libpng-dev \
      libzip-dev \
      zip unzip \
      git && \
      docker-php-ext-install pdo_mysql && \
      docker-php-ext-install bcmath && \
      docker-php-ext-install gd && \
      docker-php-ext-install zip && \
      apt-get clean

RUN useradd user && chown -R user /var/www/laravel
USER user

WORKDIR /var/www/laravel
