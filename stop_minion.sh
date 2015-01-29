#!/bin/bash
for SERVICES in docker kube-proxy.service  kubelet.service; do 
    systemctl stop $SERVICES
    systemctl status $SERVICES 
done
