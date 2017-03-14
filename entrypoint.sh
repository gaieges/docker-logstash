#!/bin/bash

set -e
set -x

# Use the LOGSTASH_CONFIG_URL env var to download and use your
# logstash.conf file.
LOGSTASH_CONFIG_URL=${LOGSTASH_CONFIG_URL:-}
LOGSTASH_CONFIG_FILE="/usr/share/logstash/pipeline/logstash.conf"
LOGSTASH_CONFIG_STRING=${LOGSTASH_CONFIG_STRING:-}

# If you don't provide a value for the LOGSTASH_CONFIG_URL env
# var, your install will default to our very basic logstash.conf file.
if [ -z "${LOGSTASH_CONFIG_URL}" ]; then
    LOGSTASH_CONFIG_URL="https://gist.github.com/pblittle/8778567/raw/logstash.conf"
fi


# Detect command line config string
if [ -n "${LOGSTASH_CONFIG_STRING}" ]; then
    # the config string overrides all
    # Yes, I know. This looks ugly.
    LOGSTASH_CONFIG_URL=""
    echo ${LOGSTASH_CONFIG_STRING} > $LOGSTASH_CONFIG_FILE
fi


if [ -n "${LOGSTASH_CONFIG_URL}" ]; then
    wget $LOGSTASH_CONFIG_URL -O $LOGSTASH_CONFIG_FILE
fi

exec /usr/share/logstash/bin/logstash \
     -f $LOGSTASH_CONFIG_FILE \
     $@
