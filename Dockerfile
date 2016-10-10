FROM svenv/base
MAINTAINER Sven van de Scheur <svenvandescheur@gmail.com>

# Install required packages
RUN apt-get update && apt-get install -y \
    libpq-dev && \

    git clone https://github.com/svenvandescheur/svenv.nl.git /srv/nginx && \
    cd /srv/nginx && \
    npm install --production && \
    pip install -r requirements.txt && \

    cd /srv/nginx/svenv/ && \
    python manage.py collectstatic --noinput

# Add file tree
ADD files /

# Download backups
RUN tarsnap -x -f $(tarsnap --list-archives | egrep [0-9]{14}-[^-]+?-svenv.nl/media | sort -r | head -n 1) && \
    tarsnap -x -f $(tarsnap --list-archives | egrep [0-9]{14}-[^-]+?-svenv.nl/database | sort -r | head -n 1)

# Set owner
RUN chown app:app -R /srv/

# Set volumes
VOLUME ["/etc/nginx/conf.d", "/etc/ssl/",  "/srv/", "/usr/local/lib/python2.7/dist-packages", "/usr/lib/python2.7/dist-packages", "/usr/local/etc/", "/var/lib/postgresql/", "/var/run/postgresql/", "/var/log/", "/var/mail"]
