FROM arm64v8/alpine
MAINTAINER Daichi Shinozaki <dseg@shield.jp>

RUN \
 apk add --update mini_httpd bash curl \
 &&\
 sed \
  -i /etc/mini_httpd/mini_httpd.conf \
  -e 's/^chroot$/#chroot/' \
  -e 's/^#nochroot$/nochroot/' \
 &&\
 rm -rf /var/cache/apk/*

EXPOSE 80

VOLUME /var/www/localhost/htdocs

MAINTAINER Maugin Thomas

RUN \
 apk add --update ffmpeg coreutils \
 &&\
 rm -rf /var/cache/apk/*

COPY rootfs /

# S6 OVERLAY
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-aarch64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-aarch64.tar.gz -C / && rm /tmp/s6-overlay-aarch64.tar.gz

ENTRYPOINT ["/init"]
