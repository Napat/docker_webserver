
# To get defalut config from container(nginx_dump) to be our resources
```
$ docker run --name nginx_dump -d nginx:alpine
$ docker cp nginx_dump:/etc/nginx/nginx.conf ./resource/
$ docker cp nginx_dump:/etc/nginx/conf.d/default.conf ./resource/
$ docker rm -f nginx_dump
$ mv ./resource/default.conf ./resource/localhost.conf
```

# Simple usage
`./run_xxx.sh`

# To build own image
 1. Edit build_xxx.sh and/or Dockerfile
 2. `./build_xxx.sh`
 
# Ref
 - https://hub.docker.com/_/nginx/
 - https://arkit.co.in/nginx-web-server-installation-and-configuration-on-centos-7-redhat-7/ 
 ** We don't need to use sites-enable feature , only simple http"**
 - http://nginx.org/en/docs/beginners_guide.html#conf_structure
 
