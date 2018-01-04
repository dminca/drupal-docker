FROM wizdevops/alpine
LABEL MAINTAINER="Daniel Andrei Minca <dminca@protonmail.com>"
ENV DRUPAL_VERSION='drupal-8.4.4' \
  DRUPAL_SHA='d2441f8e42f3dcb26f8ef00c8e07ee25c57f5437b0d9ac56119a4aa3930e7a5b'
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
    && chmod 777 /var/www/html/sites/files \
    && chown -R nobody:nogroup \
      /var/www/html/sites/default \
      /var/www/html/themes \
      /var/www/html/modules
USER nobody
VOLUME /var/www/html
