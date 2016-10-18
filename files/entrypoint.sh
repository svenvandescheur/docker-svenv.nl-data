#!/bin/bash

# Docker entrypoint script
# Executes original command

# Summary:
# --------
# * Set up script
# * Start services
# * Download latest backups
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


# Execute command
exec "$@"