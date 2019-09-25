FROM svenv/base
MAINTAINER Sven van de Scheur <svenvandescheur@gmail.com>

# Add file tree
ADD files /

# Install required packages
RUN apt-get update && apt-get install -y \
    libpq-dev \
    python3 \
    python3-pip && \

    git clone https://github.com/svenvandescheur/svenv.nl-2017.git /srv/nginx && \
    cd /srv/nginx && \
    npm install --production && \
    pip3 install -r requirements.txt && \

    cd /srv/nginx/svenv/ && \
    python3 manage.py collectstatic --noinput && \

    rsync -a svenv.nl@recovery.svenv.nl:~/recovery/ / && \
    chown -R app:app /srv/nginx/

# Set volumes
VOLUME ["/etc/letsencrypt/", "/etc/nginx/conf.d", "/etc/ssh/", "/etc/ssl/", "/root/", "/srv/", "/tmp/", "/usr/local/lib/", "/usr/local/etc/", "/var/run/postgresql/", "/var/log/", "/var/mail"]
