# dsmamontov_microservices
dsmamontov microservices repository

# kubernetes-4

настроены пайплайны деплоя хельм-чартов в кубернетес через:

helm2
вместо helm init --upgrade надо использовать
helm init --force-upgrade
у меня только так заработало

helm upgrade \
  --install \
  --wait \
  --set ui.ingress.host="$host" \
  --set $CI_PROJECT_NAME.image.tag="$CI_APPLICATION_TAG" \
  --namespace="$KUBE_NAMESPACE" \
  --version="$CI_PIPELINE_ID-$CI_JOB_ID" \
  "$name" \
  reddit-deploy/reddit/

helm3
helm upgrade \
  --install \
  --wait \
  --set ui.ingress.host="$host" \
  --set $CI_PROJECT_NAME.image.tag=$CI_APPLICATION_TAG \
  --namespace="$KUBE_NAMESPACE" \
  --version="$CI_PIPELINE_ID-$CI_JOB_ID" \
  "$name" \
  reddit-deploy/reddit/


helm2 без tiller
helm tiller run helm upgrade \
  --install \
  --wait \
  --set ui.ingress.host="$host" \
  --set $CI_PROJECT_NAME.image.tag=$CI_APPLICATION_TAG \
  --namespace="$KUBE_NAMESPACE" \
  --version="$CI_PIPELINE_ID-$CI_JOB_ID" \
  "$name" \
  reddit-deploy/reddit/

задание со звёздочкой
настроен хук для запуска деплоя при билде
curl -X POST \
     -F token=$REDDIT_TOKEN \
     -F ref=master \
     http://gitlab-gitlab/api/v4/projects/$REDDIT_PROJECT_ID/trigger/pipeline

ps. как-то сложно задание шло. гит постоянно сваливался
Error from server (BadRequest): container "gitlab" in pod "gitlab-gitlab-57c7d6cb74-jnvjv" is not available
¯\_(ツ)_/¯

# kubernetes-3

были настроены локальный кластер миникуба и кластер кубернетеса в гугл-облаке
настроены ингресс контроллеры, сетевые политики и сторадж классы

приложуха, если ещё жив кластер: https://34.102.220.39/

# kubernetes-2
скриншот рабочего приложения в кубере
https://app.slack.com/client/T6HR0TUP3/CRY9VNJFP

запустить приложение можно так:
kubectl apply -f ./ -n dev

создать кластер терраформом так:
 gcloud auth application-default login
 terraform plan

# kubernetes-1

продйен путь установки кубернетиса хард вей.
настроены три матер ноды и тьри воркер, так же настроен кластер etcd
запущены делоименты приложения реддит

# logging-1

запуск стенда: docker-compose -f docker-compose-logging.yml -f docker-compose.yml down && docker-compose -f docker-compose-logging.yml -f docker-compose.yml up -d
были развернуты: elk-стек, zipkin

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
