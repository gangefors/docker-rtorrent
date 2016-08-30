FROM gliderlabs/alpine
MAINTAINER gangefors@github

RUN apk --update add rtorrent openvpn lighttpd php php-cgi fcgi git php-json

RUN mkdir /root/.session/

COPY config/rtorrent.rc /root/rtorrent_config
COPY startup /root/
RUN echo 'include "mod_fastcgi.conf"' >> /etc/lighttpd/lighttpd.conf

# setup rutorrent
RUN git init /var/www/localhost/htdocs && \
  cd /var/www/localhost/htdocs && \
  git remote add origin https://github.com/Novik/ruTorrent.git && \
  cd /var/www/localhost/htdocs && \
  git pull origin master && \
  rm -rf /var/www/localhost/htdocs/plugins/* && \
  cd /var/www/localhost/htdocs/plugins && \
  git checkout httprpc && \
  chmod -R 777 /var/www/localhost/htdocs/share/

# setup lighttpd
RUN mkdir -p /var/run/lighttpd /run/lighttpd && \
  chown lighttpd /var/run/lighttpd /run/lighttpd

EXPOSE 49161
EXPOSE 80
VOLUME /downloads
VOLUME /vpn
VOLUME /config
VOLUME /root/.session

ENTRYPOINT ["/root/startup"]
