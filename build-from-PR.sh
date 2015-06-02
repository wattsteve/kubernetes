#!/bin/bash
# This script is intended to be run in Fedora
# Run this script when someone has submitted a PR you need but their branch is way out of date from where trunk is
# Modify the repo and branch below to reflect the Repo and Branch from the Pull Request
export REPO=https://github.com/markturansky/kubernetes.git
export BRANCH=pv_panic_fix

# Build Setup
yum install -y go git mercurial
mkdir -p /opt/go
export GOPATH=/opt/go/
mkdir -p $GOPATH/src/github.com/GoogleCloudPlatform/
cd $GOPATH/src/github.com/GoogleCloudPlatform/
rm -rf kubernetes

# Clone the Official Upstream Kubernetes Repo
git clone https://github.com/GoogleCloudPlatform/kubernetes.git
cd kubernetes

# Add the Official Repo and the Cloned Repo from which the branch in the PR was based
git remote add mark $REPO
git remote add upstream https://github.com/GoogleCloudPlatform/kubernetes.git
git fetch origin -v; git fetch upstream -v; git fetch mark -v

# checkout the branch from the Pull Request
git checkout $BRANCH

# change the remote tracking branch to upstream master 
git branch $BRANCH -u master
git pull --no-edit

# Build !
go get github.com/tools/godep
export PATH=$PATH:$GOPATH/bin
cd $GOPATH/src/github.com/GoogleCloudPlatform/kubernetes
godep restore
make
