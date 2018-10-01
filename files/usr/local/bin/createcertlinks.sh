#!/bin/bash

# Script to link nginx certificates to Lets Encrypt

# Summary:
# --------
# * Link certificates


# Link certificates
hostname=svenv.nl
dir=`ls -t /etc/letsencrypt/live/ | grep $hostname | head -n 1`
path="/etc/letsencrypt/live/$dir"

rm -f /etc/ssl/certs/svenv.nl.crt
rm -f /etc/ssl/certs/svenv.nl.key

ln -s "$path/privkey.pem" "/etc/ssl/certs/svenv.nl.key"
ln -s "$path/fullchain.pem" "/etc/ssl/certs/svenv.nl.crt"
