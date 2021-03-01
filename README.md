# Oracle Docker & Kubernetes  training 

## Some extra topics to cover 

<img src="extra.png">

## application deployment model 

<img src="appdep.png">

## Containers in reality 

<img src="containers.png">

## Container run time engine 

<img src="cre.png">

## Docker ce with linux host 

<img src="products.png">

## Docker ce installation 

<img src="install.png">

## Docker desktop for windows 10 

[docker desktop for windows 10](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)

[docker desktop for mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)

## Docker install on OL / any linux VM 

[docker for linux](https://docs.docker.com/engine/install/centos/)

## Done with installation using linux vm 

```
 14  yum  install  docker  
   15  systemctl enable  --now docker 
   16  systemctl status  docker
   
```

## Docker architecture 

<img src="darch.png">

## client to host 

<img src="img.png">

## Docker images operations 

```
❯ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
oraclelinux   8.3       d8ccb1b24024   3 weeks ago   223MB
java          latest    d23bdf5b1b1b   4 years ago   643MB
❯ docker  pull alpine
Using default tag: latest
latest: Pulling from library/alpine
ba3557a56b15: Pull complete 
Digest: sha256:a75afd8b57e7f34e4dad8d65e2c7ba2e1975c795ce1ee22fa34f8cf46f96a3be
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
❯ docker  pull  busybox
Using default tag: latest
latest: Pulling from library/busybox
5c4213be9af9: Pull complete 
rDigest: sha256:c6b45a95f932202dbb27c31333c4789f45184a744060f6e569cc9d2bf1b9ad6f
Status: Downloaded newer image for busybox:latest
docker.io/library/busybox:latest
❯ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
busybox       latest    491198851f0c   10 days ago   1.23MB
alpine        latest    28f6e2705743   11 days ago   5.61MB
oraclelinux   8.3       d8ccb1b24024   3 weeks ago   223MB
java          latest    d23bdf5b1b1b   4 years ago   643MB


```

## image to container 

<img src="process.png">

## how to create container 

```
❯ docker  run   --name ashuc1        busybox  ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: seq=0 ttl=64 time=1.550 ms
64 bytes from 127.0.0.1: seq=1 ttl=64 time=0.102 ms
64 bytes from 127.0.0.1: seq=2 ttl=64 time=0.123 ms
64 bytes from 127.0.0.1: seq=3 ttl=64 time=0.101 ms
64 bytes from 127.0.0.1: seq=4 ttl=64 time=0.090 ms
64 bytes from 127.0.0.1: seq=5 ttl=64 time=0.415 ms
64 bytes from 127.0.0.1: seq=6 ttl=64 time=0.071 ms
64 bytes from 127.0.0.1: seq=7 ttl=64 time=0.070 m

```

## checking list of running containers 

```
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED              STATUS          PORTS     NAMES
d6a442f47167   busybox   "ping 127.0.0.1"   About a minute ago   Up 59 seconds             ashuc1
```


## container with any state 

```
❯ docker  ps -a
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS                          PORTS     NAMES
d6a442f47167   busybox   "ping 127.0.0.1"   2 minutes ago   Exited (0) About a minute ago             ashuc1

```

## starting a stopped container 

```
❯ docker start  d6a442f47167
d6a442f47167
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED         STATUS         PORTS     NAMES
d6a442f47167   busybox   "ping 127.0.0.1"   4 minutes ago   Up 5 seconds             ashuc1

```

## Best practise to create a container 

```
 docker  run  --name ashuc2  -d  -it   alpine  ping 8.8.8.8
1494915ef9c0b7f8fd68a95b0975c19e3953a23947fc5ad52ad8108438b3d01b
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     20 seconds ago   Up 18 seconds             ashuc2
d6a442f47167   busybox   "ping 127.0.0.1"   8 minutes ago    Up 4 minutes              ashuc1

```

## a way to conainer management 

```
❯ docker  run  --name ashuc2  -d  -it   alpine  ping 8.8.8.8
1494915ef9c0b7f8fd68a95b0975c19e3953a23947fc5ad52ad8108438b3d01b
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     20 seconds ago   Up 18 seconds             ashuc2
d6a442f47167   busybox   "ping 127.0.0.1"   8 minutes ago    Up 4 minutes              ashuc1
❯ 
❯ docker  stop   ashuc2
ashuc2
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS         PORTS     NAMES
d6a442f47167   busybox   "ping 127.0.0.1"   11 minutes ago   Up 7 minutes             ashuc1
❯ docker  ps -a
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS                       PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     3 minutes ago    Exited (137) 6 seconds ago             ashuc2
5d127df5e178   busybox   "cal"              6 minutes ago    Exited (0) 6 minutes ago               x1
d6a442f47167   busybox   "ping 127.0.0.1"   11 minutes ago   Up 7 minutes                           ashuc1
❯ docker  start   ashuc2
ashuc2
❯ docker  ps -a
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS                     PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     3 minutes ago    Up 9 seconds                         ashuc2
5d127df5e178   busybox   "cal"              6 minutes ago    Exited (0) 6 minutes ago             x1
d6a442f47167   busybox   "ping 127.0.0.1"   11 minutes ago   Up 7 minutes                         ashuc1
❯ docker  kill  ashuc2
ashuc2
❯ docker  start  ashuc2
ashuc2
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     4 minutes ago    Up 11 seconds             ashuc2
d6a442f47167   busybox   "ping 127.0.0.1"   13 minutes ago   Up 9 minutes              ashuc1
❯ docker  ps -a
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS                     PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     5 minutes ago    Up 15 seconds                        ashuc2
5d127df5e178   busybox   "cal"              8 minutes ago    Exited (0) 8 minutes ago             x1
d6a442f47167   busybox   "ping 127.0.0.1"   13 minutes ago   Up 9 minutes                         ashuc1
❯ docker  rm  x1
x1
❯ docker  ps
CONTAINER ID   IMAGE     COMMAND            CREATED          STATUS          PORTS     NAMES
1494915ef9c0   alpine    "ping 8.8.8.8"     5 minutes ago    Up 25 seconds             ashuc2
d6a442f47167   busybox   "ping 127.0.0.1"   13 minutes ago   Up 9 minutes              ashuc1

```

## checking logs / output of process running inside container 

```
8915  docker  logs  ashuc1
 8916  docker  logs  ashuc1  -f
 
```

## Containerization process

<img src="build.png">

## Builder tools to build docker images

<img src="imgb.png">

## Vscode link 

[vscode](https://code.visualstudio.com/download)


### Dockerfile example 1 

```
❯ docker  build  -t  ashuscript:v1  /Users/fire/Desktop/myimages/shellscript
Sending build context to Docker daemon  3.584kB
Step 1/5 : FROM oraclelinux:8.3
 ---> d8ccb1b24024
Step 2/5 : MAINTAINER  ashutoshh@linux.com
 ---> Running in eb2b0cea962e
Removing intermediate container eb2b0cea962e
 ---> 348f613a9df9
Step 3/5 : RUN mkdir /mydata
 ---> Running in 32e6f0ef5e3f
Removing intermediate container 32e6f0ef5e3f
 ---> beac19996ce6
Step 4/5 : COPY oracle.sh  /mydata/oracle.sh
 ---> 048d52849e0a
Step 5/5 : CMD  ["bash","/mydata/oracle.sh"]
 ---> Running in dec081d8ae18
Removing intermediate container dec081d8ae18
 ---> 40f34bec24ad
Successfully built 40f34bec24ad
Successfully tagged ashuscript:v1
❯ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
ashuscript    v1        40f34bec24ad   8 seconds ago   223MB
busybox       latest    491198851f0c   10 days ago     1.23MB
alpine        latest    28f6e2705743   11 days ago     5.61MB

```

## from currnet location 

```
❯ docker  build  -t  ashuscript:v2  .
Sending build context to Docker daemon  3.584kB
Step 1/5 : FROM oraclelinux:8.3
 ---> d8ccb1b24024
Step 2/5 : MAINTAINER  ashutoshh@linux.com
 ---> Using cache
 ---> 348f613a9df9
Step 3/5 : RUN mkdir /mydata
 ---> Using cache
 ---> beac19996ce6
Step 4/5 : COPY oracle.sh  /mydata/oracle.sh
 ---> Using cache
 ---> 048d52849e0a
Step 5/5 : CMD  ["bash","/mydata/oracle.sh"]
 ---> Using cache
 ---> 40f34bec24ad
Successfully built 40f34bec24ad
Successfully tagged ashuscript:v2


```

## launching container from custom image

```
❯ docker  run --name ashuc3  -d -it  ashuscript:v1
69edb55b6c982e699bd239b246d99de8a3547801149e443672ca1fd45099d7a1
❯ docker  ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS     NAMES
69edb55b6c98   ashuscript:v1   "bash /mydata/oracle…"   3 seconds ago    Up 2 seconds              ashuc3
1494915ef9c0   alpine          "ping 8.8.8.8"           43 minutes ago   Up 38 minutes             ashuc2
d6a442f47167   busybox         "ping 127.0.0.1"         52 minutes ago   Up 48 minutes             ashuc1
❯ docker logs  -f  ashuc3
HEllo world
time is  Mon Mar  1 07:22:10 UTC 2021
THis is container process ...
HEllo world
time is  Mon Mar  1 07:22:17 UTC 2021
THis is container process ...
HEllo world
time is  Mon Mar  1 07:22:24 UTC 2021
THis is container process ...
HEllo world
time is  Mon Mar  1 07:22:31 UTC 2021
THis is container process ...
HEllo world
time is  Mon Mar  1 07:22:38 UTC 2021
THis is container process ...
HEllo world

```


## Kill and remove  all the containers 

```
❯ docker  ps -q
69edb55b6c98
1494915ef9c0
d6a442f47167
❯ docker kill $(docker  ps -q)
69edb55b6c98
1494915ef9c0
d6a442f47167
❯ docker rm  $(docker  ps -aq)
69edb55b6c98
1494915ef9c0
d6a442f47167

```


## using entrypoint and cmd all together 

```
 8956  docker build -t  ashuscript:v4  . 
 8957  docker run  -d  --name x2  -it  ashuscript:v4  
 8958  docker run  -d  --name x3  -it  ashuscript:v4  
 8959  docker  ps
 8960  docker run  -d  --name x5  -it  ashuscript:v4  /mydata/hello.sh 
 8961  docker  ps
❯ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED              STATUS              PORTS     NAMES
21e00ba0357a   ashuscript:v4   "/bin/bash /mydata/h…"   About a minute ago   Up About a minute             x5
71f4f1d731e1   ashuscript:v4   "/bin/bash /mydata/o…"   About a minute ago   Up About a minute             x3
cb31aed77092   ashuscript:v3   "bash /mydata/oracle…"   9 minutes ago        Up 9 minutes                  x2
dc42ec9890d5   ashuscript:v1   "ping 127.0.0.1"         11 minutes ago       Up 11 minutes                 x1

```


## access shell of a running container 

```
❯ docker exec -it  x5  bash
[root@21e00ba0357a /]# 
[root@21e00ba0357a /]# 
[root@21e00ba0357a /]# cd /mydata/
[root@21e00ba0357a mydata]# ls
hello.sh  oracle.sh
[root@21e00ba0357a mydata]# cat  /etc/os-release 
NAME="Oracle Linux Server"
VERSION="8.3"
ID="ol"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="8.3"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Oracle Linux Server 8.3"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:oracle:linux:8:3:server"
HOME_URL="https://linux.oracle.com/"
BUG_REPORT_URL="https://bugzilla.oracle.com/"

ORACLE_BUGZILLA_PRODUCT="Oracle Linux 8"
ORACLE_BUGZILLA_PRODUCT_VERSION=8.3
ORACLE_SUPPORT_PRODUCT="Oracle Linux"
ORACLE_SUPPORT_PRODUCT_VERSION=8.3
[root@21e00ba0357a mydata]# ping 127.0.0.1 


```

## Cgroups for container memory usage limit 

```
❯ docker  run -itd  --name ashux6  --memory 10m ashuscript:v4
f6ee3d3df901f7a4a8c5104a1d7b7bbcaf916bb7a64f11c6c0d0330ed5c66dec
```


## ram with cpu 

```
❯ docker  run -itd  --name ashux7  --memory 10m --cpu-shares=30 ashuscript:v4
c2599b963822a9415ec82f8b1da4fbc26100fa5c40c0565b2778a850acff2706

```

## more cgroups examples

```
8974  docker  run -itd  --name x6  --memory 10m ashuscript:v4  
 8975  docker  run -itd  --name ashux6  --memory 10m ashuscript:v4  
 8976* docker  stats  
 8977  docker  run -itd  --name ashux7  --memory 10m --cpu-shares=30 ashuscript:v4  
 8978  history
 8979  docker  ps
 8980  docker update  x1  --memory 200m 
 8981  docker update --help
 8982  docker update  x1  --memory-swap 200m 


```

## python

```
❯ docker  build  -t  ashupy:v1 -f  python.dockerfile    .
Sending build context to Docker daemon  3.072kB
Step 1/5 : FROM python
latest: Pulling from library/python
0ecb575e629c: Pull complete 
7467d1831b69: Pull complete 
feab2c490a3c: Pull complete 
f15a0f46f8c3: Pull complete 
937782447ff6: Pull complete 
e78b7aaaab2c: Pull complete 
b68a1c52a41c: Pull complete 
ddcd772f47ec: Pull complete 
aef84dafa567: Pull complete 
Digest: sha256:e2cd43d291bbd21bed01bcceb5c0a8d8c50a9cef319a7b5c5ff6f85232e82021
Status: Downloaded newer image for python:latest
 ---> 254d4a8a8f31
Step 2/5 : MAINTAINER ashutoshh@linux.com
 ---> Running in 0db495d87063
Removing intermediate container 0db495d87063
 ---> b75d80e18e31
Step 3/5 : RUN mkdir /code
 ---> Running in 387a6f91c664
Removing intermediate container 387a6f91c664
 ---> 7cf4a846945e
Step 4/5 : COPY abc.py /code/abc.py
 ---> 7f3a9e41aa3a
Step 5/5 : ENTRYPOINT ["python","/code/abc.py"]
 ---> Running in d64bbfd68314
Removing intermediate container d64bbfd68314
 ---> a9e4907a9b81
Successfully built a9e4907a9b81
Successfully tagged ashupy:v1

```

## creating container from this image

```
docker  run -itd --name ashupc1  ashupy:v1 
 8999  docker  ps
 9000  docker logs -f  ashupc1  

```





