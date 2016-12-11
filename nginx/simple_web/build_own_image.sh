#!/bin/sh

# Test OS: Windows 10 Pro
# SHELL: powershell call msysgit 

IMAGE_NAME="nginx_simple_webserv_my"

docker build -t ${IMAGE_NAME} .

# Wait to see result
sleep 5
