# Docker Demo

A sample Python Web application is used to illustrate the usage of Docker.

Build

```bash
$ docker build -t cllu/docker-demo:0.1.0 .
$ docker images cllu/docker-demo
$ docker push cllu/docker-demo
$ docker pull cllu/docker-demo
```

See the image repository on [Docker Hub](https://hub.docker.com/r/cllu/docker-demo/tags/).

For redis, we use existing image on [Docker Hub](https://hub.docker.com/_/redis/).

## Development

```bash
$ docker run -d -P --name redis redis:3.2.0
$ docker run --link redis:redis -p 0.0.0.0:8000:8000 -v $PWD/demo:/app/demo cllu/docker-demo python /app/server.py
```

Mount the source files in the `demo` folder and restart when changes are detected

## Deployment

```bash
$ docker run -d -P --name redis redis:3.2.0
$ docker run --link redis:redis -p 0.0.0.0:8000:8000 cllu/docker-demo
```
