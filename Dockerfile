FROM php:8.2-apache

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y libpng-dev && \
    docker-php-ext-install pdo pdo_mysql gd mysqli  

RUN pecl install redis \
    && docker-php-ext-enable redis pdo pdo_mysql gd ˝ 

EXPOSE 80

CMD ["apache2-foreground"]