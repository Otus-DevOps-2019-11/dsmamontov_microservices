# dsmamontov_microservices
dsmamontov microservices repository

# monitoring

собранные контейнеры:
https://hub.docker.com/repository/docker/mamontov/mongodb-exporter
https://hub.docker.com/repository/docker/mamontov/blackbox_exporter
https://hub.docker.com/repository/docker/mamontov/prometheus
https://hub.docker.com/repository/docker/mamontov/ui
https://hub.docker.com/repository/docker/mamontov/post
https://hub.docker.com/repository/docker/mamontov/comment

написан makefile для сборки и заливки
проект можно запустить так:

docker-compose up -d

# gitlab-ci-1

appuser@gitlab-ci:~$ sudo docker ps
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS                 PORTS                                                            NAMES
7e2edf4f0e38        mamontov/pipeline-reddit:v1   "/start.sh"              20 seconds ago      Up 19 seconds                                                                           prod-reddit
998dc2a65bdf        mamontov/pipeline-reddit:v1   "/start.sh"              37 seconds ago      Up 36 seconds                                                                           stage-reddit
1b0fd44711f8        gitlab/gitlab-runner:latest   "/usr/bin/dumb-init …"   8 hours ago         Up 8 hours                                                                              gitlab-runner
0adeee8604c2        gitlab/gitlab-ce:latest       "/assets/wrapper"        9 hours ago         Up 9 hours (healthy)   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:2222->22/tcp   gitlab_web_1


# docker-4

самый простой способ -- использовать директиву container_name


# docker-2

подготовлен докер-образ приложения
подготовлен пакер образ машины с докеров
написан терраформ для поднятия виртуалок
написан плейбук с динамическим инвентори для запуска прилодения в контейнере
