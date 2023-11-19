FROM alpine:latest

RUN apk add --update nginx openssl


# Copy nginx.conf in /etc/nginx/http.d
COPY nginx.conf /etc/nginx/http.d


# Create srcs directory and Copy index.html in /srcs

RUN mkdir srcs ssl-dir

COPY index.html /srcs
# COPY index.php /srcs

COPY sslCertificate.sh /ssl-dir

EXPOSE 443

# Create ssl-dir and Generate a Self-Signed Certificate
RUN cd /ssl-dir && chmod +x sslCertificate.sh && /bin/sh sslCertificate.sh


# Start NGINX in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
