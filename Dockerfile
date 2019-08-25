# Pulling image of php7.2 with apache
FROM php:7.2-apache

# updating container
# RUN apt-update

RUN bash -c 'echo -e **************************************************Updating system**************************************************\n'
RUN apt-get -y update

RUN bash -c 'echo -e **************************************************Installing system dependencies system**************************************************\n'
# 1. installing development packages
RUN apt-get install -y \
    git \
    zip \
    # curl \
    sudo \
    unzip \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++


RUN bash -c 'echo -e **************************************************Enabling rewrite headers**************************************************\n'
# Enabling mode rewrite
RUN a2enmod rewrite headers    

RUN bash -c 'echo -e **************************************************Installing php extensions**************************************************\n'
# Installing php extensions
RUN docker-php-ext-install \
    bz2 \
    intl \
    iconv \
    bcmath \
    # curl \
    opcache \
    calendar \
    mbstring \
    mysqli \
    pdo_mysql \
    zip


RUN bash -c 'echo -e **************************************************Installing mongodb php extensions**************************************************\n'
# Installing mongodb and enabling it
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb


RUN bash -c 'echo -e **************************************************Setting up composer in container**************************************************\n'
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# COPY .env.example .env
# COPY . /var/www/html
# RUN cd /var/www/html
# RUN composer install && php artisan key:generate
RUN chown -R www-data:www-data /var/www