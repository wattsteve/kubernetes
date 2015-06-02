
1) Make sure GlusterFS is running and reachable from your Kubernetes cluster

2) Edit the glusterfs-endpoints.json file to reflect an IP from your GlusterFS trusted storage pool

3) Create the "glusterfs-cluster" endpoint by running the following command:

     kubectl create -f glusterfs-endpoints.json

4) Create a Persistent Volume for GlusterFS by running the following command:

     kubectl create -f create-glusterfs-pv.yaml
     
5) Verify the Persistent Volume was created by running:

     kubectl get pv
     
6) Create a claim against the GlusterFS Persistent Volume by running the following command:

     kubectl create -f glusterfs-claim.yaml
     
7) Verify the Claim was created by running:

     kubectl get pvc

8) Submit the sample NGINX Pod to verify the claim can be mounted into the container launched by the pod

     kubectl create -f pod-example.yaml
     
9) Verify the Pod is successfully running

    kubectl get pods
    
10) curl {IP of POD}/test/hello.html

