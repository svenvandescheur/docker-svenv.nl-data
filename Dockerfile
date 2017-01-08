FROM svenv/base
MAINTAINER Sven van de Scheur <svenvandescheur@gmail.com>

# Add file tree
ADD files /

# Install required packages
RUN apt-get update && apt-get install -y \
    libpq-dev && \

    git clone https://github.com/svenvandescheur/svenv.nl.git /srv/nginx && \
    cd /srv/nginx && \
    npm install --production && \
    pip install -r requirements.txt && \

    cd /srv/nginx/svenv/ && \
    python manage.py collectstatic --noinput && \

    rsync -a svenv.nl@recovery.svenv.nl:~/recovery/ / && \
    /usr/local/bin/createcertlinks.sh

# Set volumes
VOLUME ["/etc/letsencrypt/", "/etc/nginx/conf.d", "/etc/ssh/", "/etc/ssl/", "/root/", "/srv/", "/tmp/", "/usr/local/lib/python2.7/dist-packages", "/usr/lib/python2.7/dist-packages", "/usr/local/etc/", "/var/run/postgresql/", "/var/log/", "/var/mail"]
