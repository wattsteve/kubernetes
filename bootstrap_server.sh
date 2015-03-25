#!/bin/bash
# This script installs the  Kubernetes runtime on a server. This script is required for both Master and Minion Servers

echo "Minion Bootstrap -- Yum updating to current version"
yum -y --enablerepo=updates-testing  update

echo "Minion Bootstrap -- Installing Kubernetes, Flannel, etcd"
yum -y install kubernetes flannel etcd

echo "Minion Bootstrap -- Installing, Enabling and Starting Docker"
yum -y install docker
systemctl enable docker
systemctl start docker

echo "Minion Bootstrap -- Stopping and Disabling firewalld"
systemctl disable firewalld; systemctl stop firewalld
