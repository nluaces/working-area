#! /bin/sh

kubectl create secret tls skupper-site-ca --cert=skupper-site-ca/tls.crt --key=skupper-site-ca/tls.key
kubectl create secret tls skupper-service-ca --cert=skupper-service-ca/tls.crt --key=skupper-service-ca/tls.key
kubectl create secret tls skupper-local-ca --cert=skupper-local-ca/tls.crt --key=skupper-local-ca/tls.key

kubectl create secret tls skupper-claims-server --cert=skupper-claims-server/tls.crt --key=skupper-claims-server/tls.key 
kubectl patch secret skupper-claims-server  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret skupper-site-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

kubectl create secret tls skupper-console-certs --cert=skupper-console-certs/tls.crt --key=skupper-console-certs/tls.key 
kubectl patch secret skupper-console-certs  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret skupper-local-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

kubectl create secret tls skupper-local-client --cert=skupper-local-client/tls.crt --key=skupper-local-client/tls.key 
kubectl patch secret skupper-local-client  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret skupper-local-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

kubectl create secret tls skupper-local-server --cert=skupper-local-server/tls.crt --key=skupper-local-server/tls.key 
kubectl patch secret skupper-local-server  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret skupper-local-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

kubectl create secret tls skupper-site-server --cert=skupper-site-server/tls.crt --key=skupper-site-server/tls.key 
kubectl patch secret skupper-site-server  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret skupper-site-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

kubectl create secret tls skupper-service-client --cert=skupper-service-client/tls.crt --key=skupper-service-client/tls.key 
kubectl patch secret skupper-service-client  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret skupper-service-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

exit 1
