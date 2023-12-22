#! /bin/sh
rm test-trust-ca -rf
rm test-service-certs -rf

mkdir test-trust-ca
cd test-trust-ca
ssh-keygen -t rsa -m PEM -f tls.key -q -N ""
openssl req -x509 -nodes -days 365 -key tls.key -out tls.crt -batch


cd ..
mkdir test-service-certs
cd test-service-certs
openssl req -nodes -newkey rsa:4096 -x509 -CA ../test-trust-ca/tls.crt -CAkey ../test-trust-ca/tls.key  -out tls.crt -keyout tls.key -batch

cd ..
#kubectl create secret tls test-trust-ca --cert=test-trust-ca/tls.crt --key=test-trust-ca/tls.key
#kubectl patch secret test-trust-ca -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret test-trust-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"
kubectl create secret generic test-trust-ca --from-file=ca.crt=test-trust-ca/tls.crt

kubectl create secret tls test-service-certs --cert=test-service-certs/tls.crt --key=test-service-certs/tls.key 
kubectl patch secret test-service-certs  -p="{\"data\":{\"ca.crt\": \"$(kubectl get secret test-trust-ca -o json -o=jsonpath="{.data.tls\.crt}")\"}}"

exit 1

