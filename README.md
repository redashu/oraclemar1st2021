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





