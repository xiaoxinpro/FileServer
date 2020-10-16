FROM alpine:3.8
MAINTAINER chishin <pro@xxgzs.org>

WORKDIR /
ENV VERSION 0.0.1
ENV PORT 8080
ENV PATH /web/www

RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk --no-cache add openssl wget && \
    mkdir -p -m 777 /web/www && \
    cd /web && \
    wget https://github.com/xiaoxinpro/FileServer/raw/main/build/FileServer_linux_amd64 -O ./FileServer && \
    chmod 777 /web/FileServer

VOLUME $PATH

EXPOSE $PORT

CMD /web/FileServer -c env