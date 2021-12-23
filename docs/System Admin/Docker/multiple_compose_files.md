# How to have load multiple compose file

## Overview
I wanted to split `docker-compose.yml` into multiple files - 1 service 1 file. So, in the main docker file, I could add/remove by just commenting out 1 line.

## Solution
In version 2, docker has `extends` feature see reference [here](https://docs.docker.com/compose/extends/). However, this feature was removed in version 3. So I decided to use different approach

### Loading multiple filesa
By default, docker compose will load `docker-compose.yml` and `docker-compose.override.yml` for compose files, and load `.env` for environment variable. Custom file can be specified with `-f` parameter.

``` bash
docker-compose -f a.yml -f b.yml -f c.yml up
```

The file names here can be specified in `COMPOSE_FILE` environment variable. For example,
```
COMPOSE_FILE=a.yml:b.yml:c.yml 
```

And, since .env will be loaded by docker automatically, I can use this approach to load the service I want like this

``` title=".env"
COMPOSE_FILE=docker-compose.yml:service1.yml:service2.yml 
```

### Reference
[https://docs.docker.com/compose/reference/envvars/#compose_file](https://docs.docker.com/compose/reference/envvars/#compose_file)
