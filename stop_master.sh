#!/bin/bash
for SERVICES in etcd kube-apiserver kube-controller-manager  kube-scheduler; do 
    systemctl stop $SERVICES
    systemctl status $SERVICES 
done
