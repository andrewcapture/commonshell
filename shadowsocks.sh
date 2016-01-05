#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#===============================================================================================
#   System Required:  Centos/Debian/Ubuntu
#   Description:  Install Python-Shadowsocks
#   Author: Arno <blogfeng@blogfeng.com>
#   Intro:  http://www.blogfeng.com/
#===============================================================================================
clear
echo"	Install Python-Shadowsocks
		Author:arnofeng www.blogfeng.com"
echo -n "Enter any key to continue: "  
read googdmood
echo -n "set your port: "  
read key1
if[ ! key1 ]; then
	PORT=key1
else
	PORT='2222'
fi
echo -n "set your password: " 
read key2
if[ ! key2 ]; then
	PORT=key2
else
	PASS='blogfeng.com'
fi
wget -N --no-check-certificate https://bootstrap.pypa.io/ez_setup.py
python ez_setup.py --insecure
easy_install pip
pip install shadowsocks
echo "
{

    "server": "0.0.0.0",

    "port_password": {
             ""$PORT"": ""$PASS""
              
     },

    "timeout": 300,

    "method": "aes-256-cfb"

}

" > /etc/shadowsocks.json
AUTO='nohup /usr/local/bin/ssserver -c /etc/shadowsocks.json > /dev/null 2>&1 &'
cp -r -f /etc/rc.local /etc/rc.local_sbak
sed -i 's/\"exit 0\"/\#/' /etc/rc.local
sed -i 's/\#exit 0/\#/' /etc/rc.local
sed -i "s/exit 0/$AUTO/" /etc/rc.local
ssserver -c /etc/shadowsocks.json -d start
if [ $? -eq 0 ]; then
	echo "
	#Everything seems OK!
	#your PORT is $PORT
	#your password is $PASS
	#Go try your ss!"
else
	echo "
	#Installing errors!
	#Reinstall OR Contact me!"
fi