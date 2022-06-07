# alpine-redis

#dockerhub:

arm64: 

docker pull spring59/alpine-redis:7.0

amd64: 

docker pull spring59/alpine-redis:latest

docker run -itd --name redis -p 6379:6379 spring59/alpine-redis:{tag}

默认密码：alpine

#编译

redis 7.0.0版本，其他版本自行下载替换包即可。

编译时注意arm和amd架构，dockerfile里有注释说明。如果不想要默认密码，注释掉redis.conf里requirepass

git clone git@github.com:spring59/alpine-redis.git
 
cd alpine-redis

arm:

docker build --platform=linux/arm64 -t spring59/alpine-redis:7.0 .

amd：

docker build -t spring59/alpine-redis .
