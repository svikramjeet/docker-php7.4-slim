FROM php:7.4-apache

LABEL maintainer="svikramjeet"

RUN  apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y git \
  && apt-get install -y sudo \
  && apt-get install -y exif \
  && apt-get install -y wget
  
RUN  apt-get install libzip-dev -y

RUN docker-php-ext-install gd pdo pdo_pgsql pgsql exif zip

    
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
