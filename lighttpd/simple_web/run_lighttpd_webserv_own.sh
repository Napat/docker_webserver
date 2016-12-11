#!/bin/sh

# Test OS: Windows 10 Pro
# SHELL: powershell call msysgit 
# Caution:  
#    Weird path interpretation of msysgit converts paths: https://github.com/docker/docker/issues/12751 
#    Fixed by add the leading slash('/') in front of volumn paths

IMAGE_NAME="lighttpd_webserv_my:latest"
CONTAINER_NAME="lighttpd-webserv-my"
WWW_PATH="d:/www/localhost"
TOPDIR=${PWD}
EXPORT=9002
HOSTNAME=${CONTAINER_NAME}

# remove container if running
docker ps -a | grep ${CONTAINER_NAME} | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

# run
docker run --name ${CONTAINER_NAME} \
  --hostname=${HOSTNAME} \
  -d -p 0.0.0.0:${EXPORT}:80 \
  --restart=always \
  -v /${TOPDIR}/resource/:/config/:ro \
  -v /${WWW_PATH}:/webdav:ro \
  ${IMAGE_NAME}

# Wait to see the result
sleep 5
