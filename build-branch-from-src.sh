#!/bin/bash
# This script is intended to be run in Fedora
# Modify the repo and branch below for what you would like to build
export REPO=https://github.com/rootfs/kubernetes.git
export BRANCH=remotes/origin/wip-gluster

yum install -y go git mercurial
mkdir -p /opt/go
export GOPATH=/opt/go/
mkdir -p $GOPATH/src/github.com/GoogleCloudPlatform/
cd $GOPATH/src/github.com/GoogleCloudPlatform/
rm -rf kubernetes
git clone $REPO
cd kubernetes
git checkout $BRANCH
go get github.com/tools/godep
export PATH=$PATH:$GOPATH/bin
cd $GOPATH/src/github.com/GoogleCloudPlatform/kubernetes
godep restore
make
