#!/bin/sh

set -eu

wp_path="/var/www/html"
theme_slug="${WORDPRESS_THEME_SLUG:-hello-corp}"

echo "Waiting for WordPress configuration..."
until [ -f "${wp_path}/wp-config.php" ]; do
  sleep 2
done

echo "Waiting for database connection..."
until wp db check --path="${wp_path}" --allow-root >/dev/null 2>&1; do
  sleep 2
done

if ! wp core is-installed --path="${wp_path}" --allow-root >/dev/null 2>&1; then
  echo "Installing WordPress..."
  wp core install \
    --path="${wp_path}" \
    --url="${WORDPRESS_SITE_URL:-http://localhost:8080}" \
    --title="${WORDPRESS_SITE_TITLE:-Hello Corp}" \
    --admin_user="${WORDPRESS_ADMIN_USER:-admin}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD:-admin}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL:-admin@example.com}" \
    --skip-email \
    --allow-root
fi

echo "Activating theme ${theme_slug}..."
wp theme activate "${theme_slug}" --path="${wp_path}" --allow-root

echo "WordPress bootstrap finished."
