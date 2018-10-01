#!/bin/bash

# Docker entrypoint script
# Executes original command

# Summary:
# --------
# * Set up script
# * Start services
# * Download latest backups
# * Link certificates
# * Execute command

# Set up script
set -e
set -o pipefail


# Start services
service rsyslog start
service cron start
service postfix start


# Download latest backups
rsync -a svenv.nl@recovery.svenv.nl:~/recovery/ /
chown -R app:app /srv/nginx/


# Link certificates
/usr/local/bin/createcertlinks.sh


# Execute command
exec "$@"
