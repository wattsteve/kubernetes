#!/bin/bash

echo "Minion Bootstrap -- Yum updating to current version"
yum -y update

echo "Minion Bootstrap -- Installing Kubernetes"
yum -y install kubernetes

echo "Minion Bootstrap -- Enabling and Starting Docker"
systemctl enable docker
systemctl start docker

echo "Minion Bootstrap -- Stopping and Disabling firewalld"
systemctl disable firewalld; systemctl stop firewalld
