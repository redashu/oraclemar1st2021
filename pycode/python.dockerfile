# FROM python
#FROM oraclelinux:8.3
FROM alpine
# here you are using oraclelinux as base image 
MAINTAINER ashutoshh@linux.com
# RUN dnf install python3 -y
# in OL dnf is an installer of software 
RUN apk add python3 
# apk is the installer in alpine linux 
RUN mkdir /code
COPY abc.py /code/abc.py
ENTRYPOINT ["python3","/code/abc.py"]
