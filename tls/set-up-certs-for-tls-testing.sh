#! /bin/sh

kubectl create secret tls test-trust-ca --cert=test-trust-ca/tls.crt --key=test-trust-ca/tls.key
kubectl patch secret test-trust-ca -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret test-trust-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

kubectl create secret tls test-service-certs --cert=test-service-certs/tls.crt --key=test-service-certs/tls.key 

kubectl patch secret test-service-certs  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret test-trust-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

exit 1

