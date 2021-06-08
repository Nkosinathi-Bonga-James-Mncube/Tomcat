FROM tomcat:8.0-alpine
USER root
RUN apk add openssl
ADD sample.war /usr/local/tomcat/webapps/
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=ZA/ST=Gauteng/L=Johannesburg/O=MMI/CN=localhost" -keyout \
    /etc/ssl/private/ssl.key -out /etc/ssl/certs/ssl.crt