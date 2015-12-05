# Version: 0.0.1
FROM gliderlabs/alpine
MAINTAINER Yusuf Ali "ali@yusuf.email"
RUN apk --update add rtorrent openvpn

RUN mkdir /root/.session/
RUN mkdir /config

ADD config/rtorrent.rc /config/rtorrent_config
ADD startup /root/
RUN ln -s /config/rtorrent.rc /root/.rtorrent.rc

EXPOSE 49161
VOLUME /downloads
VOLUME /vpn
VOLUME /config

ENTRYPOINT ["/root/startup"]
