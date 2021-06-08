# Tomcat set up with ssl cert
- A brief overview of how to setup a tomcat website with ssl certificates

# My approach
1. Install docker: https://docs.docker.com/engine/install/ubuntu/
2. Install docker compose: https://docs.docker.com/compose/install/
3. Pull docker images 
```
docker pull tomcat:8.0-alpine
```
4. Run container and copy server.xml for configations settings for tomcat
```
docker run -p8081:8080 tomcat
docker cp {{ container ID }}:/usr/local/tomcat/conf/server.xml /Desktop/Tomcat

```
5. Download file : https://tomcat.apache.org/tomcat-8.5-doc/appdev/sample/sample.war 
6. Create a Dockerfile to containerize Tomcat. It will include:
    * Define image used
    * Adding sample file to be host with tomcat
    * Create ssl certificate and key

7. Create docker-compose to run container. It contains:
    * Volume for logs
    * Container image that been created
    * Expose port to be used.

# To run setup
1. Build container image
```
docker build -t tomcat2 .
```
2. Run docker-compose to run docker container
```
docker-compose up
```
3. To stop Docker compose 
```
docker-compose down
```
4. To remove container
```
docker image rm -f tomcat2
```

# Reference
- Create dockerfile container

    https://www.cprime.com/resources/blog/deploying-your-first-web-app-to-tomcat-on-docker/

- Self-signed keys
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04


- How to Configure SSL/TLS for Apache Tomcat

    https://hostadvice.com/how-to/how-to-configure-https-in-apache-tomcat/

- What is SSL and what are Certificates?

    https://tldp.org/HOWTO/SSL-Certificates-HOWTO/x64.html