FROM alpine:latest

RUN apk add --update nginx openssl

# Copy nginx.conf in /etc/nginx/http.d
COPY ./conf/nginx.conf /etc/nginx/http.d

RUN mkdir ssl-dir

COPY ./tools/sslCertificate.sh /ssl-dir

EXPOSE 443

# Create ssl-dir and Generate a Self-Signed Certificate
RUN cd /ssl-dir && chmod +x sslCertificate.sh && /bin/sh sslCertificate.sh

# Start NGINX in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
