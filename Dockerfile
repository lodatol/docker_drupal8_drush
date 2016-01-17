FROM drupal:8

RUN apt-get update && apt-get install -y git sqlite mysql-client wget && \
    rm -rf /var/lib/apt/lists/* 

RUN echo date.timezone=Europe/Rome >> /usr/local/etc/php/conf.d/timezone.ini

RUN \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
ln -s /usr/local/bin/composer /usr/bin/composer && \
git clone --depth 1 https://github.com/drush-ops/drush.git /usr/local/src/drush && \
ln -s /usr/local/src/drush/drush /usr/bin/drush && \
cd /usr/local/src/drush && composer install

