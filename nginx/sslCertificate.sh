#!/bin/bash

# Define variables
PRIVATE_KEY="private.key"
CRT="certificate.crt"
CSR="certificate.csr"

# Certificate Information
COUNTRY=""
STATE=""
LOCALITY="loc"
ORGANIZATION="org"
ORG_UNIT="ou"
COMMON_NAME="rrhnizar.com"
EMAIL="rrhnizar@gmail.com"

# Step 1: Generate Private Key
openssl genpkey -algorithm RSA -out $PRIVATE_KEY

# Step 2: Generate Certificate Signing Request (CSR)
openssl req -new -key $PRIVATE_KEY -out $CSR -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"

# Step 3: Generate Self-Signed Certificate
openssl x509 -req -days 365 -in $CSR -signkey $PRIVATE_KEY -out $CRT

mkdir -p /etc/nginx/certs

cp $CRT /etc/nginx/certs/server.crt

cp $PRIVATE_KEY /etc/nginx/certs/server.key
