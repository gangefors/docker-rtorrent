# Version: 0.0.1
FROM gliderlabs/alpine
MAINTAINER Yusuf Ali "ali@yusuf.email"
RUN apk --update add rtorrent openvpn

ADD config/rtorrent.rc /root/.rtorrent.rc
ADD config/rtorrent /root/

EXPOSE 49161
EXPOSE 5000
VOLUME /downloads

ENTRYPOINT ["/root/rtorrent"]