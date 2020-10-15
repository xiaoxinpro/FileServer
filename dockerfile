FROM alpine:3.8
MAINTAINER chishin <pro@xxgzs.org>

WORKDIR /
ENV VERSION 0.0.1

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk --no-cache add openssl wget && \
    mkdir /web && mkdir /web/www \
    cd /web && \
    wget https://github.com/xiaoxinpro/FileServer/raw/main/build/FileServer_linux_amd64 -O ./FileServer && \
    chmod 777 /web/FileServer && \

VOLUME /web/www

EXPOSE 8080

CMD /web/FileServer