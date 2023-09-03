#!/bin/sh

set -eu

export NODE_ENV=production
export DEBUG="releasebell*"

# Creating a secret for web sessions
if [ ! -f /app/data/session.secret ]; then
    echo "==> Generating session secret"
    dd if=/dev/urandom bs=256 count=1 2>/dev/null | base64 > /app/data/session.secret
fi

echo "=> Create database.json"
cat <<EOF > /app/database.json
{
    "defaultEnv": "cloudron",
    "cloudron": {
        "host": "${CLOUDRON_MYSQL_HOST:-localhost}",
        "port": ${CLOUDRON_MYSQL_PORT:-3306},
        "user": "${CLOUDRON_MYSQL_USERNAME:-releasebell}",
        "password": "${CLOUDRON_MYSQL_PASSWORD:-releasebell}",
        "database": "${CLOUDRON_MYSQL_DATABASE:-releasebell}",
        "driver": "mysql",
        "multipleStatements": true
    }
}
EOF

echo "=> Create users.json"
cat <<EOF > /app/users.json
[
    {
        "username": "${RELEASEBELL_USERNAME:-admin}",
        "password": "${RELEASEBELL_PASSWORD:-releasebell}",
        "email": "${RELEASEBELL_EMAIL:-}"
    }
]
EOF

echo "=> Run db-migration"
/app/node_modules/.bin/db-migrate up

echo "=> Start application"
exec su-exec nobody:nobody node /app/index.js
