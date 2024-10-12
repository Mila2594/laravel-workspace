FROM php:8.2-cli

WORKDIR /app

RUN apt-get update
RUN apt-get install -y curl unzip
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

ADD example-app /app/example-app
