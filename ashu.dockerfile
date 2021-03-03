FROM oraclelinux:8.3
MAINTAINER ashutoshh@linux.com
RUN dnf install httpd -y
COPY mywebapp  /var/www/html/
# copy can copy content of a directory also same for ADD as well
# COPY and ADD both will check .dockerignore file first 
EXPOSE 80
# optional step but if u want contaier IP must bind with some default port 
# then use EXPOSE 
ENTRYPOINT  /usr/sbin/httpd -DFOREGROUND 
# THis is the binary to start httpd daemon 