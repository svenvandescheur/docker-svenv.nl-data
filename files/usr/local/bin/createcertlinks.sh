#!/bin/bash

# Script to link nginx certificates to Lets Encrypt

# Summary:
# --------
# * Link certificates


# Link certificates
hostname=`hostname`
dir=`ls -t /etc/letsencrypt/live/ | grep $hostname | head -n 1`
path="/etc/letsencrypt/live/$dir"

ln -l "$path/privkey.pem" "/etc/ssl/certs/svenv.nl.key"
ln -l "$path/fullchain.pem" "/etc/ssl/certs/svenv.nl.crt"