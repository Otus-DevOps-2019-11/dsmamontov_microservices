build-all: build-ui build-comment build-post build-prometheus build-blackbox-exporter build-mongodb-exporter

build-ui:
	cd ./src/ui && bash ./docker_build.sh

build-comment:
	cd ./src/comment && bash ./docker_build.sh

build-post:
	cd ./src/post-py && bash ./docker_build.sh

build-blackbox-exporter:
	cd ./monitoring/blackbox && docker build -t mamontov/blackbox_exporter .

build-mongodb-exporter:
	cd ./monitoring/mongodb && docker build -t namontov/mongodb_exporter .

build-prometheus:
	cd ./monitoring/prometheus && docker build -t mamontov/prometheus .

push-all: ui-push comment-push post-push blackbox-exporter-push prometheus-push mongodb-exporter-push

ui-push:
	docker push mamontov/ui

comment-push:
	docker push mamontov/comment

post-push:
	docker push mamontov/post

blackbox-exporter-push:
	docker push mamontov/blackbox_exporter

mongodb-exporter-push:
	docker push mamontov/mongodb_exporter

prometheus-push:
	docker push mamontov/ui
