FROM wordpress:php8.2-apache

# Small quality-of-life tools for local development and troubleshooting.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        less \
        mariadb-client \
        unzip \
    && curl -fsSL -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp \
    && rm -rf /var/lib/apt/lists/*

# Keep the default Apache document root used by the official WordPress image.
WORKDIR /var/www/html
