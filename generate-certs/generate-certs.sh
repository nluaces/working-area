#! /bin/sh
mkdir skupper-site-ca
cd skupper-site-ca
ssh-keygen -t rsa -m PEM -f tls.key -q -N ""
openssl req -x509 -nodes -days 365 -key tls.key -out tls.crt -batch

cd ..
mkdir skupper-service-ca
cd skupper-service-ca
ssh-keygen -t rsa -m PEM -f tls.key -q -N ""
openssl req -x509 -nodes -days 365 -key tls.key -out tls.crt -batch

cd ..
mkdir skupper-local-ca
cd skupper-local-ca
ssh-keygen -t rsa -m PEM -f tls.key -q -N ""
openssl req -x509 -nodes -days 365 -key tls.key -out tls.crt -batch

cd ..
mkdir skupper-claims-server
cd skupper-claims-server
openssl req -nodes -newkey rsa:4096 -x509 -CA ../skupper-site-ca/tls.crt -CAkey ../skupper-site-ca/tls.key  -out tls.crt -keyout tls.key -addext "subjectAltName = DNS:skupper.nluaces, DNS:claims-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-edge-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-inter-router-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud" -batch

cd ..
mkdir skupper-console-certs
cd skupper-console-certs
openssl req -nodes -newkey rsa:4096 -x509 -CA ../skupper-local-ca/tls.crt -CAkey ../skupper-local-ca/tls.key  -out tls.crt -keyout tls.key -addext "subjectAltName = DNS:skupper.nluaces, DNS:claims-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-edge-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-inter-router-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud" -batch

cd ..
mkdir skupper-local-client
cd skupper-local-client
openssl req -nodes -newkey rsa:4096 -x509 -CA ../skupper-local-ca/tls.crt -CAkey ../skupper-local-ca/tls.key  -out tls.crt -keyout tls.key -batch

cd ..
mkdir skupper-local-server
cd skupper-local-server
openssl req -nodes -newkey rsa:4096 -x509 -CA ../skupper-local-ca/tls.crt -CAkey ../skupper-local-ca/tls.key  -out tls.crt -keyout tls.key -addext "subjectAltName = DNS:skupper-router-local, DNS:skupper-router-local.nluaces.svc.cluster.local,DNS:claims-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-edge-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-inter-router-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud" -batch

cd ..
mkdir skupper-site-server
cd skupper-site-server
openssl req -nodes -newkey rsa:4096 -x509 -CA ../skupper-site-ca/tls.crt -CAkey ../skupper-site-ca/tls.key  -out tls.crt -keyout tls.key -addext "subjectAltName = DNS:skupper-router.nluaces, DNS:claims-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-edge-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud, DNS:skupper-inter-router-nluaces.skupper-3-153f1de160110098c1928a6c05e19444-0000.eu-de.containers.appdomain.cloud" -batch

cd ..
mkdir skupper-service-client
cd skupper-service-client
openssl req -nodes -newkey rsa:4096 -x509 -CA ../skupper-service-ca/tls.crt -CAkey ../skupper-service-ca/tls.key  -out tls.crt -keyout tls.key -batch

exit 1
