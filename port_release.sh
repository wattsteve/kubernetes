#!/bin/bash
# This script creates soft symbolic links of the binaries for a new release untarred in /opt/ over an existing deployment
rm -rf /usr/bin/kube-apiserver
rm -rf /usr/bin/kube-scheduler
rm -rf /usr/bin/kube-controller-manager 
rm -rf /usr/bin/kubectl
rm -rf /usr/bin/kubelet
rm -rf /usr/bin/kube-proxy

ln -s /opt/kubernetes/server/kubernetes/server/bin/kube-apiserver /usr/bin/kube-apiserver
ln -s /opt/kubernetes/server/kubernetes/server/bin/kube-controller-manager /usr/bin/kube-controller-manager
ln -s /opt/kubernetes/server/kubernetes/server/bin/kubectl /usr/bin/kubectl
ln -s /opt/kubernetes/server/kubernetes/server/bin/kubelet /usr/bin/kubelet
ln -s /opt/kubernetes/server/kubernetes/server/bin/kube-proxy /usr/bin/kube-proxy
ln -s /opt/kubernetes/server/kubernetes/server/bin/kube-scheduler /usr/bin/kube-scheduler
ln -s /opt/kubernetes/server/kubernetes/server/bin/kubernetes /usr/bin/kubernetes
ln -s /opt/kubernetes/server/kubernetes/server/bin/hyperkube /usr/bin/hyperkube
