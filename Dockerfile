# Usa la imagen base de PHP
FROM php:8.2-cli

# Establece el directorio de trabajo
WORKDIR /app

# Instala dependencias necesarias para PHP y Composer
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Instala Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

# Copia la aplicación al contenedor
COPY example-app /app/example-app

# Instala las dependencias de Laravel
WORKDIR /app/example-app
RUN composer install

# Exponer el puerto 8000
EXPOSE 8000

# Comando para ejecutar el servidor de desarrollo de Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
