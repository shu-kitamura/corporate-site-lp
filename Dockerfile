FROM wordpress:php8.2-apache

# Small quality-of-life tools for local development and troubleshooting.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        less \
        mariadb-client \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# Keep the default Apache document root used by the official WordPress image.
WORKDIR /var/www/html
