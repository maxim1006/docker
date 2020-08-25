### docker ps
список всех запущенных в системе докеров

### docker build -t image__name dockerfile__path
сбилдить докер image ex: docker build -t maxim1006/demoapp:1.0 .
-t это --tag

на выходе получаю id (Successfully built 48a305f17997) который затем использую в docker run

### docker push
когда соберу докер файл пушу его в хранилище потом ктото сделает docker pull чтобы его забрать

### docker run -p 5000:8080 image__id
ex: docker run -p 5000:8080 48a305f17997
-p это матчинг localPort:imagePort чтобы смог у себя запустить (теперь смогу в своем браузере по http://localhost:5000/ посмотреть)

docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0
There are a couple of common flags here:

--publish asks Docker to forward traffic incoming on the host’s port 8000 to the container’s port 8080. Containers have their own private set of ports, so if you want to reach one from the network, you have to forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.
--detach asks Docker to run this container in the background.
--name specifies a name with which you can refer to your container in subsequent commands, in this case bb.

(https://docs.docker.com/engine/reference/commandline/run/)

### volumes (mount) 
Маунт тоже что и volume только с более verbose syntax
для шаринга даты между контейнерами, создаю на локальной машине папку 
docker volume create folder__name
ex.: docker volume create shared-docker

Команды  
docker volume ls - узнать все вольюмы
docker volume inspect volume__name (ex.  docker volume inspect shared-docker) - инфо о вольюме
docker volume rm volume__name - удалить вольюм

Пример запуска докера с вольюмом
(-d Run container in background and print container ID)

docker run -p 5000:8080 -d \
  --name demoapp \
  --mount source=shared-docker,target=/app \
  48a305f17997

### docker inspect image__name

