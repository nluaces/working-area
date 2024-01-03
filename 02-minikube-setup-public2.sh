#! /bin/sh

export KUBECONFIG=$HOME/.kube/public2
export QDROUTERD_IMAGE=quay.io/skupper/skupper-router:main
#export SKUPPER_SERVICE_CONTROLLER_IMAGE=quay.io/nluaces/service-controller:latest
minikube start 
kubectl create namespace public2
kubectl config set-context --current --namespace public2
skupper init --site-name site2 --enable-cluster-permissions
skupper token create ~/public2-token.yaml
skupper link create ~/public1-token.yaml 

exit 1
