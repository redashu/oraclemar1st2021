FROM java AS stage1 
maintainer ashutoshh@linux.com
RUN mkdir /mycode
ADD hello.java  /mycode/hello.java
# copy and ADD both are same but add can take source from URL 
# while copy can only take from local system 
WORKDIR  /mycode
# changing directory during image build time 
RUN javac hello.java
# compiling java code to Bin -- it will be created class file at /mycode 
# CMD  ["java","myclass"]

# Stage 2 

FROM gcr.io/distroless/java:11 
COPY  --from=stage1  /mycode  /mycode
# here in new image /mycode will be created 
WORKDIR /mycode
# from Stage1 i am only taking /mycode data and pasting into a directory 
CMD ["java","myclass"]
# So final image size will gcr image + /mycode size 
