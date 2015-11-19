#!/bin/bash

# meant to be run inside a container

docker run --net=host --rm -e GOPATH=/gopath -v $PWD:/pwd golang:1.5.1 /pwd/scripts/build-kubectl.sh
