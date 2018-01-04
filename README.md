# Drupal on Docker
> Installation carefully followed according to the [official Drupal docs][1]

### Services

Web server:

- Nginx (because it's the best server out there :sparkles: )

 :mailbox_with_mail: Database:

- PostgreSQL 9.1.2+

 :elephant: PHP:

- PHP 5.5.9+

Everything carefully running by the click of a `docker-compose up`

## Persistent Drupal volume
> If you want to store the Drupal installation locally, please proceed
installing [local-persist][4] docker driver.

To use the `local-persist` driver, then [add it][5] in the `volumes` block:

```yml
volumes:
  php:
    driver: local-persist
    driver_opts:
      mountpoint: /absolute/path/on/host/machine/
```

## Useful resources:
- [PostgreSQL][2] official docker image
- [Drupal][3] WizDevOps docker image

[1]: https://www.drupal.org/docs/user_guide/en/install-prepare.html
[2]: https://store.docker.com/images/postgres
[3]: https://store.docker.com/community/images/wizdevops/drupal
[4]: https://github.com/CWSpear/local-persist
[5]: https://stackoverflow.com/a/42234691/2733115
