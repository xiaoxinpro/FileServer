FROM alpine:3.8
MAINTAINER chishin <pro@xxgzs.org>

ENV VERSION 0.1.1
ENV WEB_PORT 8080
ENV WEB_PATH /web/www

COPY docker/FileServer_docker_amd64_linux /web/FileServer

RUN mkdir -p -m 755 /web/www && \
    chmod 755 /web/FileServer && \
    rm -rf /var/cache/apk/*

VOLUME $WEB_PATH

EXPOSE $WEB_PORT

CMD /web/FileServer -c env