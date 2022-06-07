# alpine-redis

#dockerhub:
arm64: docker pull spring59/alpine-redis:7.0

amd64: docker pull spring59/alpine-redis:latest

默认密码：alpine

#编译
如果不想要默认密码，注释掉redis.conf里requirepass
arm:
docker build --platform=linux/arm64 -t spring59/alpine-redis:7.0 .
amd
docker build -t spring59/alpine-redis .
