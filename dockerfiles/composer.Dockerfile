FROM composer:latest

RUN adduser -D user
USER user
WORKDIR /var/www/laravel

ENTRYPOINT ["composer", "--ignore-platform-reqs"]
