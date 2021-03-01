FROM oraclelinux:8.3 
#  My docker engine will be using this image as base image 
# if image is not present locally then DE can pull from Docker hub
MAINTAINER  ashutoshh@linux.com
# optional info -- but good for help 
RUN mkdir /mydata
# So run instrcution is for performing operation during image build time
# like installing , creating , deleting 
COPY oracle.sh  /mydata/oracle.sh
COPY hello.sh   /mydata/hello.sh 
# very clearily copy data from client system to docker host 
# during image build process
# this data will be present in the newly created docker image
# CMD  ["bash","/mydata/oracle.sh"]
#ENTRYPOINT  ["bash","/mydata/oracle.sh"]
ENTRYPOINT ["/bin/bash"]
CMD ["/mydata/oracle.sh"]
# Entrypoint is a replacement of CMD 
# CMD is for only default process of image
# when you create container from this image then it will be default process
