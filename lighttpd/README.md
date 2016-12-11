
# To get defalut config from container(dump) to be our resources
```
$ docker run --name dump -d jgeusebroek/webdav:latest
$ mkdir -p resource
$ docker cp dump:/config/htpasswd ./resource/
$ docker cp dump:/config/webdav.conf ./resource/
$ docker rm -f dump
```

# Simple usage
`./run_xxx.sh`

# To build own image
 1. Edit build_xxx.sh and/or Dockerfile
 2. `./build_xxx.sh`
 
# You could use online htpasswd generator then edit ./resource/htpasswd
 - https://www.transip.nl/htpasswd/

# Ref
 - https://hub.docker.com/r/jgeusebroek/webdav/

 
