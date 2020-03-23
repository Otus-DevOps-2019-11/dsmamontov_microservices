# dsmamontov_microservices
dsmamontov microservices repository

# kubernetes-1

продйен путь установки кубернетиса хард вей.
настроены три матер ноды и тьри воркер, так же настроен кластер etcd
запущены делоименты приложения реддит

# monitoring-2

настроены дашборды и поднята графана с кадвизором

канал с алертами в слак
https://app.slack.com/client/T6HR0TUP3/CRY9VNJFP/details/apps

настройки мониоринга докера daemon.json
cadvisor как-то больше данных собирает

для дашборда докер энжина использовал этот дашборд https://grafana.com/grafana/dashboards/1229

для телеграфа поднят телеграф + инфлюкс дб
дашборд использовал такой https://grafana.com/grafana/dashboards/1150

картинка с алертом на почту в чате в слаке

# monitoring-1

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
