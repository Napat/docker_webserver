#!/bin/sh

# Test OS: Windows 10 Pro
# SHELL: powershell call msysgit 

IMAGE_NAME="mylighttpd"

docker build -t ${IMAGE_NAME} .

# Wait to see result
sleep 5
