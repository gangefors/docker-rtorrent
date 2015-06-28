# Version: 0.0.1
FROM gliderlabs/alpine
MAINTAINER Yusuf Ali "ali@yusuf.email"
RUN apk --update add rtorrent openvpn

ADD config/rtorrent.rc /root/.rtorrent.rc
ADD startup /root/
ADD config/checkMyTorrentIp.png.torrent /root/test.torrent

EXPOSE 49161
EXPOSE 5000
VOLUME /downloads

ENTRYPOINT ["/root/startup"]