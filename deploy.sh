#! /bin/sh

echo $1
docker stop $1
docker rm $1
docker rmi leewind/apigw
cd /Users/leewind/Projects/milkt/net.pocrd.api
mvn clean install -Dmaven.test.skip
cp ./apigw/target/apigw.war ~/Projects/docker/milkt-apigw-docker
cd /Users/leewind/Projects/docker/milkt-apigw-docker
docker build -t leewind/apigw .
docker run --name leewind-apigw -p 8080:8080 2181:2181 -d leewind/apigw
