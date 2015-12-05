# Version: 0.0.1
FROM gliderlabs/alpine
MAINTAINER Yusuf Ali "ali@yusuf.email"
RUN apk --update add rtorrent openvpn lighttpd php php-cgi fcgi git php-json

RUN mkdir /root/.session/
RUN mkdir /config

ADD config/rtorrent.rc /config/rtorrent_config
ADD startup /root/
RUN ln -s /config/rtorrent.rc /root/.rtorrent.rc
RUN echo 'include "mod_fastcgi.conf"' >> /etc/lighttpd/lighttpd.conf

# setup rutorrent
RUN git init /var/www/localhost/htdocs
RUN cd /var/www/localhost/htdocs && git remote add origin https://github.com/Novik/ruTorrent.git
RUN cd /var/www/localhost/htdocs && git pull origin master
RUN rm -rf /var/www/localhost/htdocs/plugins/*
RUN cd /var/www/localhost/htdocs/plugins && git checkout create erasedata httprpc source _task
RUN chmod -R 777 /var/www/localhost/htdocs/share/


EXPOSE 49161
EXPOSE 80
VOLUME /downloads
VOLUME /vpn
VOLUME /config

ENTRYPOINT ["/root/startup"]
