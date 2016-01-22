FROM drupal:8
MANTEINER Lodato Luciano
RUN apt-get update && apt-get install -y sqlite mysql-client wget git && \
    rm -rf /var/lib/apt/lists/*

RUN \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
ln -s /usr/local/bin/composer /usr/bin/composer && \
composer global require drush/drush:dev-master

RUN echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc


RUN pecl install uploadprogress
RUN echo "extension=uploadprogress.so" >> /usr/local/etc/php/conf.d/uploadprogress.ini
RUN echo date.timezone=Europe/Rome >> /usr/local/etc/php/conf.d/timezone.ini



