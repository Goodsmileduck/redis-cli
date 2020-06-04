
# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/goodsmileduck/redis-cli) and is the recommended method of installation.

```bash
docker pull goodsmileduck/redis-cli:latest
```

Alternatively you can build the image yourself and specify desired [Redis version](http://download.redis.io/releases/).

```bash
docker build -t goodsmileduck/redis-cli github.com/goodsmileduck/redis-cli --build-arg REDIS_VERSION=6.0.4
```

## Quickstart

Try connect redis-cli to localhost with default port :

```bash
docker run --name redis-cli -it goodsmileduck/redis-cli
```

## Command-line arguments

You can customize the launch command of Redis server by specifying arguments to `redis-cli` on the `docker run` command. For example the following command will ping to `hostname` with port `6379` and will delete container after finish:

```bash
docker run --rm --name redis-cli -it goodsmileduck/redis-cli redis-cli -h hostname -p 6379 ping
```

