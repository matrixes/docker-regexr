FROM php:7.2-apache

RUN apt update && apt install -y vim git zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install mysqli
RUN a2enmod rewrite

COPY regexr-3.6.1 /var/www/html
WORKDIR /var/www/html/server

RUN composer install

EXPOSE 80 443
