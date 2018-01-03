FROM wizdevops:alpine
LABEL MAINTAINER="Daniel Andrei Minca <dminca@protonmail.com>"
USER nobody
ENV \
  DRUPAL_VERSION='drupal-8.4.3' \
  DRUPAL_SHA='62092df0bb4aec22504b04128f71f1372cdccb7572136b3846ec36769014f49b'
RUN set -x \
    && apk add --update --no-cache \
      tar \
      curl \
    && mkdir -vp /var/www/html \
    && cd !$; wget http://ftp.drupal.org/files/projects/drupal-$(DRUPAL_VERSION).tar.gz -P /var/www/html \
    && echo "$(DRUPAL_SHA)  $(DRUPAL_VERSION).tar.gz" | sha256sum -c - | grep "OK" \
    && tar -xzfv /var/www/html/$(DRUPAL_VERSION).tar.gz -C /var/www/html --skip-old-files --strip-components 1 \
    && rm -rfv /var/www/html/$(DRUPAL_VERSION).tar.gz \
    && cp /var/www/html/sites/default.settings.php /var/www/html/sites/settings.php \
    && cp /var/www/html/sites/default.services.yml /var/www/html/sites/services.yml \
    && chmod 666 /var/www/html/sites/settings.php /var/www/html/sites/services.yml \
    && mkdir /var/www/html/sites/files \
    && chmod 777 /var/www/html/sites/files
VOLUME /var/www/html
