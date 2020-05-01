FROM alpine
MAINTAINER Stanislav Serebrennikov <goodsmileduck@gmail.com>

ENV REDIS_VERSION 5.0.3
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz

RUN apk update && apk upgrade \
    && apk add --update --no-cache --virtual build-deps gcc make linux-headers musl-dev tar \
    && wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL" \
    && mkdir -p /usr/src/redis \
    && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
    && rm redis.tar.gz \
    && make -C /usr/src/redis install redis-cli /usr/bin \
    && rm -r /usr/src/redis \
    && apk del build-deps \
    && rm -rf /var/cache/apk/*

CMD  ["redis-cli"]
