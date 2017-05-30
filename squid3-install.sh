#!/bin/bash

# Squid Installer
# Author: https://blog.hostonnet.com
# Email: admin@hostonnet.com
# Github: https://github.com/HostOnNet/squid-proxy-installer

if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 16.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/hostonnet/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    update-rc.d squid defaults
elif cat /etc/*release | grep DISTRIB_DESCRIPTION | grep "Ubuntu 14.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid3/passwd
    /bin/rm -f /etc/squid3/squid.conf
    /usr/bin/touch /etc/squid3/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/hostonnet/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    service squid3 restart
    ln -s /etc/squid3 /etc/squid
    #update-rc.d squid3 defaults
    ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "jessie"; then
    # OS = Debian 8
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid3/passwd
    /bin/rm -f /etc/squid3/squid.conf
    /usr/bin/touch /etc/squid3/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/hostonnet/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    service squid3 restart
    update-rc.d squid3 defaults
    ln -s /etc/squid3 /etc/squid
else
    echo "OS NOT SUPPORTED. Contact admin@hostonnet.com to add support for your OS"
    exit 1;
fi


#/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
