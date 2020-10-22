FROM alpine:3.8
MAINTAINER chishin <pro@xxgzs.org>

WORKDIR /
ENV VERSION 0.0.1
ENV WEB_PORT 8080
ENV WEB_PATH /web/www

ADD build/FileServer_linux_amd64 /web/FileServer

RUN mkdir -p -m 755 /web/www && \
    chmod 755 /web/FileServer && \
    rm -rf /var/cache/apk/*

VOLUME $WEB_PATH

EXPOSE $WEB_PORT

CMD /web/FileServer -c env