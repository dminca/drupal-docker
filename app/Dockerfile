FROM wizdevops/alpine
LABEL MAINTAINER="Daniel Andrei Minca <dminca@protonmail.com>"
ENV DRUPAL_VERSION='drupal-8.4.3' \
  DRUPAL_SHA='10f78082ba1199e38a3478b10f94e5753ee625c7e67fc9c59b59f2b15e7be09f'
RUN set -x \
    && apk add --update --no-cache \
      tar \
      curl \
    && mkdir -vp /var/www/html \
    && cd /var/www/html; wget http://ftp.drupal.org/files/projects/${DRUPAL_VERSION}.tar.gz -P /var/www/html \
    && echo "${DRUPAL_SHA}  ${DRUPAL_VERSION}.tar.gz" | sha256sum -c - | grep "OK" \
    && tar xzvf /var/www/html/${DRUPAL_VERSION}.tar.gz -C /var/www/html --skip-old-files --strip-components 1 \
    && rm -rfv /var/www/html/${DRUPAL_VERSION}.tar.gz \
    && cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/settings.php \
    && cp /var/www/html/sites/default/default.services.yml /var/www/html/sites/services.yml \
    && chmod 666 /var/www/html/sites/settings.php /var/www/html/sites/services.yml \
    && mkdir /var/www/html/sites/files \
    && chmod 777 /var/www/html/sites/files
USER nobody
VOLUME /var/www/html
