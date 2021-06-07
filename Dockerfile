FROM tomcat:8.0-alpine
ADD sample.war /usr/local/tomcat/webapps/
EXPOSE 8080
COPY ssl_cert.crt ssl_key.key /usr/local/tomcat/temp/
COPY server.xml /usr/local/tomcat/conf/