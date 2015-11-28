#DocTorrent
A minimalist rTorrent client for docker with OpenVPN capabilities.

**Note:** Requires priviledged run in order to connect using OpenVPN

###Minimalistic

* Container size is a mere **15 mb**
* Ram consumption with 300 torrents sums up to **12 mb**
* OpenVPN ram consumption is a piffling **2.5 mb**


###OpenVPN

The container is for the purest of torrenters, routing all their traffic through a VPN connection. Your personal OpenVPN configuration files should be stored in `/downloads/vpn`. They will be automatically loaded and properly routed.

###Exposed
* Incoming TCP port: 49161
* SCGI TCP port: 5000
    * for ruTorrent interaction
* Downloads Volume: /downloads
* rTorrent scratch files: /downloads
    * .session folder will be created automatically
* VPN Configuration Volume: /vpn
    * Drop your VPN configuration files
      * main VPN config file must end in .ovpn
      
        startup calls `openvpn --config *.ovpn`


OpenVPN configuration files will be stored outside the container to ease container upgrades and ensure maximum compatibility