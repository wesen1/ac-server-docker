# ac-server-docker
Dockerfile for a standard AssaultCube server

This is using the AssaultCube server files from the current [1.2.0.2 release](https://github.com/assaultcube/AC/releases/download/v1.2.0.2/AssaultCube_v1.2.0.2.tar.bz2).

## Usage

### docker (default files, will be reset when the container is stopped)

`docker run -p "28763:28763/udp" -p "28764:28764/udp" wesen1/assaultcube-server:1.2.0.2`

### docker

`docker run -p "28763:28763/udp" -p "28764:28764/udp" -v "$PWD/ac-server/config:/ac-server/config:rw" -v "$PWD/ac-server/packages:/ac-server/packages:rw" wesen1/assaultcube-server:1.2.0.2`

### docker-compose.yaml

```yaml
version: "2"
services:
    ac-server:
        image: "wesen1/assaultcube-server:1.2.0.2"
        ports:
            - "28763:28763/udp"
            - "28764:28764/udp"
        volumes:
            - ./ac-server/config:/ac-server/config:rw
            - ./ac-server/packages:/ac-server/packages:rw
```

`docker compose up`


## Build

1. Run `apt-get install docker-compose`
2. Run `docker build -t ac-server .`
