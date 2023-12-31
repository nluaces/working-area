#! /bin/sh

export KUBECONFIG=$HOME/.kube/private1
export QDROUTERD_IMAGE=quay.io/skupper/skupper-router:main
kind delete cluster
kind create cluster
kubectl create namespace private1
kubectl config set-context --current --namespace private1
skupper init --site-name site3 --ingress none --console-auth unsecured
skupper link create ~/public1-token.yaml
skupper link create ~/public2-token.yaml 

exit 1
