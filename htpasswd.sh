#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "====================================="
echo "# A tool like htpasswd for Nginx    #"
echo "#-----------------------------------#"
echo "# Author:Arno http://www.blogfeng.com"
echo "====================================="

#set UserName

	username=""
	read -p "Please input UserName:" username
	if [ "$username" = "" ]; then
		echo "Error:UserName can't be NULL!"
		exit 1
	fi
	echo "==========================="
	echo "UserName was: $username"
	echo "==========================="

#set password

	unpassword=""
	read -p "Please input the Password:" unpassword
	if [ "$unpassword" = "" ]; then
		echo "Error:Password can't be NULL!"
		exit 1
	fi
	echo "==========================="
	echo "Password was: $unpassword"
	echo "==========================="
password=$(perl -e 'print crypt($ARGV[0], "pwdsalt")' $unpassword)

#set htpasswd file

	htfile=""
	read -p "Please input Auth filename:" htfile
	if [ "$htfile" = "" ]; then
		echo "Error:Auth filename can't be NULL!"
		exit 1
	fi
	echo "==========================="
	echo "Auth File: /etc/nginx/conf/$htfile"
	echo "==========================="

	get_char()
	{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
	}
	echo ""
	echo "Press any key to Creat...or Press Ctrl+c to cancel"
	char=`get_char`

if [ ! -f /etc/nginx/conf/$htfile.conf ]; then
    echo "Create Auth file......"
	touch /usr/local/nginx/conf/$htfile.conf
	cat >/usr/local/nginx/conf/$htfile.conf<<eof
$username:$password
eof
	echo "Create Auth file successful,auth file path:/usr/local/nginx/conf/$htfile.conf."
else
	echo "File already exists,please run this script again."
	exit 1
fi