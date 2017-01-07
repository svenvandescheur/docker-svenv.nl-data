#!/bin/bash

# Script to link nginx certificates to Lets Encrypt

# Summary:
# --------
# * Link certificates


# Link certificates
hostname=`hostname`
dir=`ls -t /etc/letsencrypt/live/ | grep $hostname | head -n 1`
path="/etc/letsencrypt/live/$dir"

ln /etc/ssl/certs/svenv.nl.key "$path/privkey.pem"
ln /etc/ssl/certs/svenv.nl.crt "$path/fullchain.pem"