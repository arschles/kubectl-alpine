#!/bin/bash

curl -L https://github.com/kubernetes/kubernetes/archive/v1.1.1.tar.gz > k8s-1.1.1.tar.gz
tar -xvzf k8s-1.1.1.tar.gz
mkdir -p $GOPATH/src/k8s.io
mv kubernetes-1.1.1 $GOPATH/src/k8s.io/kubernetes
echo "building..."
docker run --rm -v $PWD:/pwd -v $GOPATH:/gopath -e GOPATH=/gopath -w /gopath/src/k8s.io/kubernetes/cmd/kubectl -e CGO_ENABLED=0 golang:1.5.1 go build -o /pwd/kubectl
