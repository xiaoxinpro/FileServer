FROM alpine:3.8
MAINTAINER chishin <pro@xxgzs.org>

WORKDIR /
ENV VERSION 0.1.1
ENV WEB_PORT 8080
ENV WEB_PATH /web/www

ADD docker/web/ /web/

VOLUME $WEB_PATH

EXPOSE $WEB_PORT

CMD /web/FileServer -c env