#!/usr/bin/env bash
set -e

# Wait for MySQL if we're using it
if [ "${DB_ENGINE:-sqlite}" = "mysql" ]; then
  echo "Waiting for MySQL at ${DB_HOST:-db}:${DB_PORT:-3306}..."
  # Try for up to ~40s
  for i in {1..40}; do
    if python - <<'PY'
import sys, os, socket
host = os.environ.get("DB_HOST","db")
port = int(os.environ.get("DB_PORT","3306"))
s = socket.socket(); 
try:
    s.settimeout(1.5); s.connect((host, port))
    sys.exit(0)
except Exception:
    sys.exit(1)
PY
    then
      echo "MySQL is up!"
      break
    fi
    sleep 1
  done
fi

# Apply migrations
echo "Running migrations..."
python manage.py migrate --noinput

# Collect static in dev is optional; keep it quick
# python manage.py collectstatic --noinput

echo "Starting: $*"
exec "$@"
