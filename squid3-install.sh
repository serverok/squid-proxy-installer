#!/bin/bash

# Squid Installer
# Author: https://www.serverOk.in & JReverse
# Email: info@serverOk.in
# Github: https://github.com/serverok/squid-proxy- // https://github.com/JReverse/squid-proxy-installer
if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 20.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 19.10"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 19.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.04.2 LTS"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.10"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    update-rc.d squid defaults
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 16.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    update-rc.d squid defaults
elif cat /etc/*release | grep DISTRIB_DESCRIPTION | grep "Ubuntu 14.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid3/passwd
    /bin/rm -f /etc/squid3/squid.conf
    /usr/bin/touch /etc/squid3/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
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
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    service squid3 restart
    update-rc.d squid3 defaults
    ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "stretch"; then
    # OS = Debian 9
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 7777 -j ACCEPT
    /sbin/iptables-save
    systemctl enable squid
    systemctl restart squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "CentOS Linux 7"; then
    yum install squid httpd-tools -y
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    systemctl enable squid
    systemctl restart squid
    firewall-cmd --zone=public --permanent --add-port=7777/tcp
    firewall-cmd --reload
elif cat /etc/os-release | grep PRETTY_NAME | grep "CentOS Linux 8"; then
    yum install squid httpd-tools -y
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    systemctl enable squid
    systemctl restart squid
    firewall-cmd --zone=public --permanent --add-port=7777/tcp
    firewall-cmd --reload
elif cat /etc/os-release | grep PRETTY_NAME | grep "CentOS Stream 8"; then
    yum install squid httpd-tools -y
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/JReverse/squid-proxy-installer/master/squid.conf
    systemctl enable squid
    systemctl restart squid
    firewall-cmd --zone=public --permanent --add-port=7777/tcp
    firewall-cmd --reload
else
    echo "OS NOT SUPPORTED. Contact info@ServerOk.in or https://github.com/JReverse to add support for your OS"
    exit 1;
fi