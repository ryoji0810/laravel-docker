FROM php:7.4-fpm
WORKDIR /tmp

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

# Install Libs
RUN apt-get -y update && \
    apt-get -y install zip unzip libxml2-dev zlib1g-dev libzip-dev libonig-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# PHP Install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require hirak/prestissimo && \
    docker-php-ext-install pdo pdo_mysql tokenizer xml ctype json intl bcmath zip opcache

RUN pecl install xdebug-2.9.5 && \
    docker-php-ext-enable xdebug

# php-fpm config
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www/html