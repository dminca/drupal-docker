FROM drush/drush:9-alpine
LABEL MAINTAINER="Daniel Andrei Minca <@dminca>"
ARG PROJECT_NAME
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG DB_ADDR
ARG POSTGRES_DB
ARG SITE_NAME
RUN set -x \
  && drush dl drupal \
    --drupal-project-rename=${PROJECT_NAME} \
  && drush site-install standard \
    --db-url='pgsql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${DB_ADDR}/${POSTGRES_DB}' \
    --site-name=${SITE_NAME}
