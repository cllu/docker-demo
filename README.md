# Docker Demo

A sample Python Web application is used to illustrate the usage of Docker.

```bash
$ docker run -d -P --name redis redis:3.2.0
$ docker run --link redis:redis -p 0.0.0.0:8000:8000 demo-app
```
