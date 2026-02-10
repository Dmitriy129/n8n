#!/bin/sh
set -eu

if [ -z "${DOMAIN:-}" ]; then
  echo "DOMAIN env var is required" >&2
  exit 1
fi

CERT_DIR="/etc/letsencrypt/live/$DOMAIN"
FULLCHAIN="$CERT_DIR/fullchain.pem"
PRIVKEY="$CERT_DIR/privkey.pem"

if [ ! -f "$FULLCHAIN" ] || [ ! -f "$PRIVKEY" ]; then
  echo "Creating temporary self-signed cert for $DOMAIN"
  if ! command -v openssl >/dev/null 2>&1; then
    apk add --no-cache openssl >/dev/null
  fi
  mkdir -p "$CERT_DIR"
  openssl req -x509 -nodes -newkey rsa:2048 -days 1 \
    -keyout "$PRIVKEY" -out "$FULLCHAIN" \
    -subj "/CN=$DOMAIN"
fi

# Certbot may write to domain-0001 when domain dir already exists; prefer that for SSL
if [ -f "/etc/letsencrypt/live/${DOMAIN}-0001/fullchain.pem" ]; then
  export CERT_PATH="${DOMAIN}-0001"
else
  export CERT_PATH="${DOMAIN}"
fi

# Generate nginx config from template (replaces default, so 80 + 443 use our config)
envsubst '${DOMAIN} ${CERT_PATH}' < /etc/nginx/templates/n8n.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
