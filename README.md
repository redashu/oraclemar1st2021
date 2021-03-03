# Docker volumes 

<img src="volume.png">


## Creating mysql container without external storage 

```
docker  run -itd --name mydb -e MYSQL_ROOT_PASSWORD=Oracle098  mysql:5.6

❯ docker  ps
CONTAINER ID   IMAGE       COMMAND                  CREATED              STATUS              PORTS      NAMES
df03af0bed21   mysql:5.6   "docker-entrypoint.s…"   About a minute ago   Up About a minute   3306/tcp   mydb


```
