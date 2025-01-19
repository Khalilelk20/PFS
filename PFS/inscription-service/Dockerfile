FROM php:7.4-apache
RUN docker-php-ext-install mysqli
COPY . /var/www/html/
RUN chmod -R 755 /var/www/html
EXPOSE 80
