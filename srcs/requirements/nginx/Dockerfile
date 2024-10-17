FROM alpine:3.19

RUN apk update && \
    apk add --no-cache openrc && \
    apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=yourdomain.com"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
