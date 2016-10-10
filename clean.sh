#!/bin/bash

# Docker cleanup script
# Stops and removes docker containers/images

# Summary:
# --------
# * Stop docker containers
# * Remove docker containers
# * Remove docker images


# Stop docker containers
docker stop  $(docker ps -q)

# Remove docker containers
docker rm $(docker ps -a -q)

# Remove docker images
docker rmi $(docker images -q)