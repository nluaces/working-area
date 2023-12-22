#! /bin/sh

minikube delete
export KUBECONFIG=$HOME/.kube/private1
export QDROUTERD_IMAGE=quay.io/skupper/skupper-router:main
minikube start 
minikube tunnel
