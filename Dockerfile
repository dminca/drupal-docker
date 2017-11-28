FROM drush/drush:9-alpine
LABEL MAINTAINER="Daniel Andrei Minca <@dminca>"
ARG PROJECT_NAME
RUN set -x \
  && drush dl drupal \
    --drupal-project-rename=${PROJECT_NAME} \
  && drush site-install standard \
    --db-url='pgsql://${DB_USER}:${POSTGRES_PASSWORD}@${DB_ADDR}/${POSTGRES_DB}' \
    --site-name=${SITE_NAME}
