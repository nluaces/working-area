#! /bin/sh

export KUBECONFIG=$HOME/.kube/private1
export QDROUTERD_IMAGE=quay.io/skupper/skupper-router:main
#export SKUPPER_SERVICE_CONTROLLER_IMAGE=quay.io/nluaces/service-controller:latest
minikube start 
kubectl create namespace private1
kubectl config set-context --current --namespace private1
skupper init --site-name site3 --enable-flow-collector --enable-console --console-user admin --console-password 1234 --enable-cluster-permissions --routers 3
skupper link create ~/public1-token.yaml
skupper link create ~/public2-token.yaml 
kubectl apply -f ~/workspace/working-area/deployment-ms-a.yaml
skupper expose deployment productcatalogservice --address productcatalogservice --port 5001,5002  --protocol http2 --generate-tls-secrets --publish-not-ready-addresses

exit 1
