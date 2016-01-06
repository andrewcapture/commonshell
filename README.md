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