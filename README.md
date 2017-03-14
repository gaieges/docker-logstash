# Logstash docker image that allows environment config

> This image is intended to allow you to spin up a logstash image without having to build it with the configuration embedded yourself.  Plug and play.  It also attempts to be agnostic to whatever your use case is.

# Getting started

This will create a simple logstash instance that utilizes a [default config located here](https://gist.github.com/pblittle/8778567/raw/logstash.conf)
```
docker run -d \
  --name logstash \
  gaieges/logstash
```

Without any configuration changes, an example `logstash.conf` will be created for you. You can override the example config by passing a `LOGSTASH_CONFIG_URL` env var in your `docker run` command using a `-e` flag pointing to your config file.

```
docker run -d \
  --name logstash \
  -e LOGSTASH_CONFIG_URL=https://gist.github.com/pblittle/8778567/raw/logstash.conf \
  gaieges/logstash
```

If you want to set the config string in the command line, use the `LOGSTASH_CONFIG_STRING` environment var.

```
docker run -d \
  --name logstash \
  -e LOGSTASH_CONFIG_STRING="input { stdin { } } output { stdout {} }"
  gaieges/logstash
```

See the docker-compose.yml for an example on how to use it alongside other tools
