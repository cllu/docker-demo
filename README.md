# Docker Demo

A sample Python Web application is used to illustrate the usage of Docker.

Instructions:

- use `docker-compose build` to build application images

## Development

- use `docker-compose up` to start containers

## Deployment

Create a consul machine:

```bash
$ docker-machine create \
  -d virtualbox \
  consul
```

Run `consul-server` on consul machine:

```bash
$ eval $(docker-machine env consul)
$ docker run -d \
  -p $(docker-machine ip consul):8500:8500 \
  -h consul \
  --restart always \
  gliderlabs/consul-server -bootstrap
```

Create Swarm master machine

```bash
$ docker-machine create \
  -d virtualbox \
  --swarm \
  --swarm-master \
  --swarm-discovery="consul://$(docker-machine ip consul):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip consul):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  master
```

Create a slave machine:

```bash
$ docker-machine create \
  -d virtualbox \
  --swarm \
  --swarm-discovery="consul://$(docker-machine ip consul):8500" \
  --engine-opt="cluster-store=consul://$(docker-machine ip consul):8500" \
  --engine-opt="cluster-advertise=eth1:2376" \
  slave
```

Run registrator on master and slave

```bash
eval $(docker-machine env master)

docker run -d \
  --name=registrator \
  -h $(docker-machine ip master) \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
  gliderlabs/registrator:v6 \
  consul://$(docker-machine ip consul):8500

eval $(docker-machine env slave)

docker run -d \
  --name=registrator \
  -h $(docker-machine ip slave) \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
  gliderlabs/registrator:v6 \
  consul://$(docker-machine ip consul):8500
```

Then we are ready to connect to Swarm `eval $(docker-machine env -swarm master)`.

- run `export CONSUL_IP=$(docker-machine ip consul)`
- use `docker-compose -f docker-compose-production.yml up -d` to start containers.
- use `docker-compose -f docker-compose-production.yml scale app=2` to start more app containers.
