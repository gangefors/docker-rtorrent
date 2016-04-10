# DocTorrent

[![](https://badge.imagelayers.io/yusufali/rtorrent:latest.svg)](https://imagelayers.io/?images=yusufali/rtorrent:latest 'Get your own badge on imagelayers.io')
[![Build Status](https://travis-ci.org/drgroot/docker-rtorrent.svg?branch=master)](https://travis-ci.org/drgroot/docker-rtorrent)

A minimalist rTorrent client for docker with OpenVPN capabilities. This also has rutorrent bound to port 80 using lighttpd.

**Note:** Requires priviledged run in order to connect using OpenVPN

## Minimalistic

* Container size is a mere **65 mb**
* Ram consumption with 300 torrents sums up to **45 mb**
* OpenVPN ram consumption is a piffling **2.5 mb**


## OpenVPN

The container is for the purest of torrenters, routing all their traffic through a VPN connection. Your personal OpenVPN configuration files should be stored in `/vpn`. They will be automatically loaded and properly routed. The configuration files for the openvpn must end in `ovpn`. This is because startup calls `openvpn --config *.ovpn`


## Volumes

**/config**
    
- Store your `rtorrent.rc` file in here

**/vpn**

- Drop your VPN configuration files here

**/downloads**

- Downloads volume

**/root/.session**

- For if you need to migrate your existing session folder


## Exposed Ports

* Incoming TCP port: 49161
* ruTOrrent TCP port: 80