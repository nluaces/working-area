#! /bin/sh

export KUBECONFIG=$HOME/.kube/public1
export QDROUTERD_IMAGE=quay.io/skupper/skupper-router:main
#export SKUPPER_SERVICE_CONTROLLER_IMAGE=quay.io/nluaces/service-controller:latest
minikube start 
kubectl create namespace public1
kubectl config set-context --current --namespace public1
skupper init --site-name site1 --enable-cluster-permissions
skupper token create ~/public1-token.yaml --uses 2 

exit 1
