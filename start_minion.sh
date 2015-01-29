#!/bin/bash
for SERVICES in docker kube-proxy.service  kubelet.service; do 
    systemctl start $SERVICES
    systemctl status $SERVICES 
done
