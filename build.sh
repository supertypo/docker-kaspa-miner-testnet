#!/bin/sh

docker build --pull $(dirname $0) -t supertypo/kaspa-miner-test:latest

if [ "$1" = "push" ]; then
  docker push supertypo/kaspa-miner-test:latest
fi

