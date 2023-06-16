FROM debian:bullseye
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 443:443
RUN apt update -y \
    && apt install openssl -y \
    && apt install nginx -y \
    && openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out \
    /etc/nginx/certificate.pem -keyout /etc/nginx/privatekey.pem \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost"
CMD ["nginx", "-g", "daemon off;"]
