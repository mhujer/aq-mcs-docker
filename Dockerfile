# inspired by https://github.com/geertw/docker-php-ci/blob/master/php-7.0-no-xdebug/Dockerfile

FROM php:7.0

RUN apt-get update \
    && apt-get install -y git zip zlib1g-dev libxml2-dev \
    && apt-get clean \
    && docker-php-ext-install opcache \
    && docker-php-ext-install soap \
    && docker-php-ext-install zip

RUN echo "memory_limit = -1;" > $PHP_INI_DIR/conf.d/memory_limit.ini

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
