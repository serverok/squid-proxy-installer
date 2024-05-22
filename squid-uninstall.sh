#!/bin/bash

############################################################
# Squid Proxy Installer
# Author: Yujin Boby
# Email: admin@serverOk.in
# Github: https://github.com/serverok/squid-proxy-installer/
# Web: https://serverok.in/squid
# If you need professional assistance, reach out to
# https://serverok.in/contact
############################################################

if [ `whoami` != root ]; then
	echo "ERROR: You need to run the script as user root or add sudo before command."
	exit 1
fi

if [ ! -f /usr/bin/sok-find-os ]; then
    echo "/usr/bin/sok-find-os not found"
    exit 1
fi

rm -f /root/squid3-install.sh > /dev/null 2>&1

SOK_OS=$(/usr/bin/sok-find-os)

if [ $SOK_OS == "ERROR" ]; then
    cat /etc/*release
    echo
    echo -e "\e[1;31m====================================================="
    echo -e "\e[1;31mOS NOT SUPPORTED"
    echo -e "\e[1;31m====================================================="
    echo -e "\e[0m"
    echo -e "Contact me to add support for your OS.\n"
    echo -e "https://serverok.in/contact\n"
    exit 1;
fi

if [ $SOK_OS == "ubuntu2404" ]; then
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
    rm -rf /etc/squid/
elif [ $SOK_OS == "ubuntu2204" ]; then
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
    rm -rf /etc/squid/
elif [ $SOK_OS == "ubuntu2004" ]; then
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
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
elif [ $SOK_OS == "debian11" ]; then
    echo "Uninstalling Squid Proxy on Debian 11"
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
    /bin/rm -rf /etc/squid/
    /bin/rm -rf /var/spool/squid
elif [ $SOK_OS == "debian12" ]; then
    echo "Uninstalling Squid Proxy on Debian 12"
    /usr/bin/apt -y remove --purge squid squid-common squid-langpack
    /bin/rm -rf /etc/squid/
    /bin/rm -rf /var/spool/squid
elif [ $SOK_OS == "centos7" ]; then
    yum remove squid -y
    /bin/rm -rf /etc/squid/
elif [ "$SOK_OS" == "centos8" ] || [ "$SOK_OS" == "almalinux8" ] || [ "$SOK_OS" == "almalinux9" ]; then
    yum remove squid -y
    /bin/rm -rf /etc/squid/
elif [ "$SOK_OS" == "centos8s" ]; then
    dnf remove squid -y
    /bin/rm -rf /etc/squid/
elif [ "$SOK_OS" == "centos9" ]; then
    dnf remove squid -y
    /bin/rm -rf /etc/squid/
fi

rm -f /usr/bin/squid-add-user > /dev/null 2>&1
rm -f /usr/bin/sok-find-os > /dev/null 2>&1
rm -f /usr/bin/squid-uninstall > /dev/null 2>&1

echo 
echo 
echo "Squid Proxy uninstalled."
echo "Thank you for using serverok.in squid proxy installer"
echo "If you want to reinstall Squid Proxy Server, check https://serverok.in/squid"
echo 