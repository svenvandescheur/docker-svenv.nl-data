#!/bin/bash

# Script to link nginx certificates to Lets Encrypt

# Summary:
# --------
# * Link certificates


# Link certificates
dir=`ls -t /etc/letsencrypt/live/ | head -n 1`
path="/etc/letsencrypt/live/$dir"

ln -s "$path/privkey.pem" "/etc/ssl/certs/svenv.nl.key"
ln -s "$path/fullchain.pem" "/etc/ssl/certs/svenv.nl.crt"