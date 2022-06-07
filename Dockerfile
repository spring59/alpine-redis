#arm64v8
FROM alpine:latest@sha256:c3c58223e2af75154c4a7852d6924b4cc51a00c821553bbd9b3319481131b2e0
#amd64
#FROM alpine:latest@sha256:4ff3ca91275773af45cb4b0834e12b7eb47d1c18f770a0b151381cd227f4c253
MAINTAINER spring59

ARG REDIS_VERSION="7.0.0"
#amd
#COPY entrypoint.sh gosu-amd64 redis-${REDIS_VERSION}.tar.gz redis.conf /
#arm
COPY entrypoint.sh gosu-arm64 redis-${REDIS_VERSION}.tar.gz redis.conf /

RUN \
  build_packages="build-base linux-headers openssl" && \
  apk --update add ${build_packages} && \
  #mv gosu-amd64 /usr/local/bin/gosu && \
  mv gosu-arm64 /usr/local/bin/gosu && \
  chmod +x /usr/local/bin/gosu && \
  cd /tmp && \
  mv /redis-${REDIS_VERSION}.tar.gz redis.tar.gz && \
  tar xzf redis.tar.gz && \
  mv redis-${REDIS_VERSION} redis &&\
  cd /tmp/redis && \
  make && \
  make install && \
  cp redis.conf /etc/redis.conf && \
  adduser -D redis && \
  mkdir /data && \
  chown redis:redis /data && \
  rm -rf /tmp/* && \
  apk del ${build_packages} && \
  rm -rf /var/cache/apk/* && \
  mv /redis.conf /etc/redis.conf

VOLUME ["/data"]
WORKDIR /data
EXPOSE 6379
ENTRYPOINT ["/entrypoint.sh"]
CMD ["redis-server", "/etc/redis.conf"]
