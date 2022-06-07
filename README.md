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


备注：
仓库所需要下载文件地址

https://github.com/tianon/gosu/releases/download/1.14/gosu-amd64

https://github.com/tianon/gosu/releases/download/1.14/gosu-arm64

http://download.redis.io/releases/redis-7.0.0.tar.gz


