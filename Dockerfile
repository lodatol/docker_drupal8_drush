FROM drupal:8

RUN apt-get update && apt-get install -y git sqlite mysql-client wget sendmail && \
    rm -rf /var/lib/apt/lists/*

RUN \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
ln -s /usr/local/bin/composer /usr/bin/composer && \
git clone --depth 1 https://github.com/drush-ops/drush.git /usr/local/src/drush && \
ln -s /usr/local/src/drush/drush /usr/bin/drush && \
cd /usr/local/src/drush && composer install


RUN pecl install uploadprogress
RUN echo "extension=uploadprogress.so" >> /usr/local/etc/php/conf.d/uploadprogress.ini
RUN echo date.timezone=Europe/Rome >> /usr/local/etc/php/conf.d/timezone.ini


EXPOSE 80 443 25


CMD service sendmail start && apache2 -D FOREGROUND