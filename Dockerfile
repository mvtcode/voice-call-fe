# syntax = docker/dockerfile:1.3
FROM nginx:1.25.4-alpine3.18
WORKDIR /app
RUN mkdir -p /app/web; mkdir -p /app/ssl; 
COPY ./index.html /app/web
COPY ./js /app/web/js
COPY ./ssl /app/ssl
RUN chown nginx:nginx -R /app/ssl
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443