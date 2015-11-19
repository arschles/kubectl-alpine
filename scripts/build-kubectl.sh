#!/bin/bash

curl -L https://github.com/kubernetes/kubernetes/archive/v1.1.1.tar.gz > k8s-1.1.1.tar.gz
tar -xvzf k8s-1.1.1.tar.gz
mkdir -p $GOPATH/src/k8s.io
mv kubernetes-1.1.1 $GOPATH/src/k8s.io/kubernetes
cd $GOPATH/src/k8s.io/kubernetes/cmd/kubectl
export PATH=$PATH:$GOPATH/bin
go get github.com/tools/godep
CGO_ENABLED=0 godep go build -o /pwd/kubectl
