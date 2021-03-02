# Recap for day 1 

## CRE 

<img src="cre.png">

## docker engine and its few component understanding 

<img src="component.png">

## Container has these many things 

```
❯ docker  run -it  --rm  alpine  sh
/ # 
/ # ls
bin    dev    etc    home   lib    media  mnt    opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # ps  -e
PID   USER     TIME  COMMAND
    1 root      0:00 sh
    9 root      0:00 ps -e
/ # free -m 
              total        used        free      shared  buff/cache   available
Mem:           1990         387         155         367        1447        1081
Swap:          1023          55         968
/ # fdisk -l
/ # ifconfig 
eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:02  
          inet addr:172.17.0.2  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:11 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:906 (906.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)



```

## Inspecting docker image with format 

```
❯ docker  inspect  dockerashu/ashupy:v4
[
    {
        "Id": "sha256:b692df35b0e37dbb12343e8be4655e692c9ea14ad37852733bf6f04bb04bea65",
        "RepoTags": [
            "dockerashu/ashupy:v4",
            "ashupy:v4"
        ],
        "RepoDigests": [
            "dockerashu/ashupy@sha256:ae7b1f1ed9f942ccee57af2e3989f77e29f1a202f987f63a0e4ee87723e27a89"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2021-03-01T09:41:40.1241772Z",
        "Container": "084116b8507bd333fe05d363a551c1fedb901f77fec3a65933994e1ae7c23e80",
        "ContainerConfig": {

-======



❯ docker  inspect  dockerashu/ashupy:v4   -f '{{.ID}}'
sha256:b692df35b0e37dbb12343e8be4655e692c9ea14ad37852733bf6f04bb04bea65
❯ docker  inspect  dockerashu/ashupy:v4   --format='{{.ID}}'
sha256:b692df35b0e37dbb12343e8be4655e692c9ea14ad37852733bf6f04bb04bea65
❯ docker  inspect  dockerashu/ashupy:v4   --format='{{.RepoTags}}'
[dockerashu/ashupy:v4 ashupy:v4]
❯ docker  inspect  dockerashu/ashupy:v4   --format='{{.ContainerConfig.Cmd}}'
[/bin/sh -c #(nop)  ENTRYPOINT ["python3" "/code/abc.py"]]

```

## Replacing entrypoint parent process

```
 docker  run -dit --name x2  --entrypoint ping   dockerashu/ashupy:v4   127.0.0.1
a5f5076826cf626cd84d5e61cb35bbec3ddefd26e040d4f138f27b6653fd53b2
❯ docker  ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS          PORTS     NAMES
a5f5076826cf   dockerashu/ashupy:v4   "ping 127.0.0.1"         6 seconds ago    Up 4 seconds              x2
76a256de7545   dockerashu/ashupy:v4   "python3 /code/abc.p…"   38 seconds ago   Up 36 seconds             x1

```


