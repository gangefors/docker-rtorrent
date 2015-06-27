# Version: 0.0.1
FROM gliderlabs/alpine
MAINTAINER Yusuf Ali "ali@yusuf.email"
RUN apk --update add rtorrent openssh-client

ADD config/rtorrent.rc /root/.rtorrent.rc
ADD config/rtorrent /etc/init.d/

EXPOSE 49161
EXPOSE 5000
VOLUME /downloads

CMD ["/etc/init.d/rtorrent"]