#!/bin/bash
for SERVICES in etcd kube-apiserver kube-controller-manager  kube-scheduler; do 
    systemctl start $SERVICES
    systemctl status $SERVICES 
done
