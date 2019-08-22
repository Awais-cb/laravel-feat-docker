# Pulling image of php7.2 with apache
FROM php:7.2-apache

# updating container
# RUN apt-update
RUN apt-get -y update
