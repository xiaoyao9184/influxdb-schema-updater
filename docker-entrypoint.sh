#!/bin/bash

CMD=""

if [[ ! -z "$URL" ]]; then
    CMD="$CMD --url $URL"
fi
if [[ ! -z "$CONFIG" ]]; then
    CMD="$CMD --config $CONFIG"
fi
if [[ ! -z "$FORCE" ]]; then
    CMD="$CMD --force"
fi
if [[ ! -z "$DIFF" ]]; then
    CMD="$CMD --diff"
fi
if [[ ! -z "$DRYRUN" ]]; then
    CMD="$CMD --dryrun"
fi

if [[ -z "$URL" ]]; then
    CMD="$CMD --help"
fi
if [[ -z "$CMD" ]]; then
    CMD="$CMD --help"
fi

echo "perl ./influxdb-schema-updater$CMD"

perl /influxdb-schema-updater/influxdb-schema-updater${CMD}