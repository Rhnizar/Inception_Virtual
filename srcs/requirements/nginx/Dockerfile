FROM alpine:latest

RUN apk add --update nginx openssl


# Copy nginx.conf in /etc/nginx/http.d
COPY nginx.conf /etc/nginx/http.d

COPY test.html /

RUN mkdir ssl-dir

COPY sslCertificate.sh /ssl-dir

EXPOSE 443

# Create ssl-dir and Generate a Self-Signed Certificate
RUN cd /ssl-dir && chmod +x sslCertificate.sh && /bin/sh sslCertificate.sh

# WORKDIR /var/www/wordpress

# Start NGINX in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
