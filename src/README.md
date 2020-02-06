# Micorservices

docker run -d --network=reddit --network-alias=post_db1 --network-alias=comment_db1 mongo:latest
docker run -d --network=reddit --network-alias=post1 -e POST_DATABASE_HOST='post_db1' mamontov/post:1.0
docker run -d --network=reddit --network-alias=comment1 -e COMMENT_DATABASE_HOST='comment_db1' mamontov/comment:2.0
docker run -d --network=reddit -p 9292:9292 -e COMMENT_SERVICE_HOST='comment1' -e POST_SERVICE_HOST='post1' mamontov/ui:3.0

[~/projects/dsmamontov_microservices/src]$ docker images | grep mamontov                                                                                                                     *[docker-3]
mamontov/comment           2.0                 3fa6a81ab5bc        12 minutes ago      235MB
mamontov/ui                3.0                 a3b120411b1e        23 hours ago        238MB
mamontov/ui                2.0                 6256ba109054        25 hours ago        459MB
mamontov/ui                1.0                 601f3f88be1b        47 hours ago        784MB
mamontov/comment           1.0                 3b719428568a        47 hours ago        782MB
mamontov/post              1.0                 f7a5fe86852b        47 hours ago        110MB
mamontov/ubuntu-tmp-file   latest              83efa34931ca        2 days ago          124MB
