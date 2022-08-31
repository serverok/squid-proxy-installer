#!/bin/bash
############################################################
# Squid Proxy Installer
# Author: Yujin Boby
# Email: info@serverok.in
# Github: https://github.com/serverok/squid-proxy-installer/
# Web: https://serverok.in/squid
############################################################
# For paid support, contact
# https://serverok.in/contact
############################################################

if [ `whoami` != root ]; then
	echo "ERROR: You need to run the script as user root or add sudo before command."
	exit 1
fi

if [ ! -f /usr/local/bin/sok-find-os ]; then
    echo "/usr/local/bin/sok-find-os not found"
    exit 1
fi

SOK_OS=$(/usr/local/bin/sok-find-os)

if [ $SOK_OS == "ubuntu2204" ]; then
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
    rm -rf /etc/squid/
elif [ $SOK_OS == "ubuntu2004" ]; then
    /usr/bin/apt -y remove --purge squid*
    rm -rf /etc/squid/
elif [ $SOK_OS == "ubuntu1804" ]; then
    /usr/bin/apt -y remove --purge squid3
    /bin/rm -rf /etc/squid/
elif [ $SOK_OS == "ubuntu1604" ]; then
    /usr/bin/apt -y remove --purge squid3
    /bin/rm -rf /etc/squid3/
    /bin/rm -rf /etc/squid/
elif [ $SOK_OS == "ubuntu1404" ]; then
    /usr/bin/apt remove --purge squid3 -y
    /bin/rm -rf /etc/squid3/
    /bin/rm -rf /etc/squid/
elif [ $SOK_OS == "debian8" ]; then
    echo "Uninstalling Squid Proxy on Debian 8"
    /usr/bin/apt -y remove --purge squid
    /bin/rm -rf /etc/squid3/
    /bin/rm -rf /etc/squid/
elif [ $SOK_OS == "debian9" ]; then
    echo "Uninstalling Squid Proxy on Debian 9"
    /usr/bin/apt -y remove --purge squid
    /bin/rm -rf /etc/squid/
    /bin/rm -rf /var/spool/squid
elif [ $SOK_OS == "debian10" ]; then
    echo "Uninstalling Squid Proxy on Debian 10"
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
    /bin/rm -rf /etc/squid/
    /bin/rm -rf /var/spool/squid
elif [ $SOK_OS == "centos7" ]; then
    yum remove squid -y
    /bin/rm -rf /etc/squid/
elif [ $SOK_OS == "centos8" ]; then
    yum remove squid -y
    /bin/rm -rf /etc/squid/
else
    echo "OS NOT SUPPORTED.\n"
    echo "Contact https://serverok.in/contact to add support for your OS."
    exit 1;
fi

rm -f /usr/local/bin/squid-add-user > /dev/null 2>&1

echo 
echo 
echo "Squid Proxy uninstalled."
echo "Thank you for using serverok.in squid proxy installer"
echo "If you want to reinstall Squid Proxy Server, check https://serverok.in/squid"
echo 