# commonshell
common shell for myself

## 1.install python-shadowsocks on Centos/Debian/Ubuntu
* wget -N --no-check-certificate https://raw.githubusercontent.com/arnofeng/commonshell/master/shadowsocks.sh
* chmod 771 ./shadowsocks.sh
* ./shadowsocks.sh install

## 2.htpasswd for Nginx 
* wget -N --no-check-certificate https://raw.githubusercontent.com/arnofeng/commonshell/master/htpasswd.sh
* chmod 771 ./htpasswd.sh
* ./htpasswd.sh install

``````nginx
location /
{
	auth_basic "Authorized users only";
	auth_basic_user_file {$path};
}
```

## 4.install vpn for Openvz/Xen(Centos/Debian)
* for Openvz, before beginning PPTPD install, you should cat follows:

** #cat /dev/net/tun (#cat: /dev/net/tun: File descriptor in bad state)
** #cat /dev/ppp (#cat: /dev/ppp: No such device or address)