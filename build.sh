#!/bin/sh

docker build --pull $(dirname $0) -t supertypo/kaspa-miner-test:latest

