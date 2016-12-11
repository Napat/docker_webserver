#!/bin/sh

# Test OS: Windows 10 Pro
# SHELL: powershell call msysgit 
# Issue(fixed):  
#    Weird path interpretation of msysgit converts paths: https://github.com/docker/docker/issues/12751 
#    Fixed by add the leading slash('/') in front of volumn paths

IMAGE_NAME="nginx_simple_webserv_my"
CONTAINER_NAME="nginx-simple-webserv-my"
WWW_PATH="d:/www/localhost"
TOPDIR=${PWD}
EXPORT=8002
HOSTNAME=${CONTAINER_NAME}

# remove container if running
# docker rm -f ${CONTAINER_NAME}
docker ps -a | grep ${CONTAINER_NAME} | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

docker run --name ${CONTAINER_NAME} \
  --hostname=${HOSTNAME} \
  --restart=always \
  -v /${TOPDIR}/resource/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /${TOPDIR}/resource/mylocalhost.conf:/etc/nginx/conf.d/default.conf:ro \
  -v /${WWW_PATH}:/usr/share/nginx/html:ro \
  -d -p ${EXPORT}:80 \
  ${IMAGE_NAME}

# Wait to see the result
sleep 5
