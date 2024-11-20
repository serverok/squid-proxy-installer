#!/bin/bash

############################################################
# Squid Proxy Installer
# Author: Yujin Boby (Edited By: Sanjay Singh)
# Email: admin@serverOk.in
# Github: https://github.com/serverok/squid-proxy-installer/
# Web: https://serverok.in/squid
# If you need professional assistance, reach out to
# https://serverok.in/contact
############################################################


checks(){
    # Check or root access if available then pass
    if [ `whoami` != root ]; then
        echo "ERROR: You need to run the script as user root or add sudo before command."
        exit 1
    fi

    # Check for already install squid if not found pass
    if [[ -d /etc/squid/ || -d /etc/squid3/ ]]; then
        echo -e "\nSquid Proxy already installed.\n"
        echo -e "If you want to reinstall, first uninstall squid proxy by running the following command:\n"
        echo -e "sudo squid-uninstall\n"
        exit 1
    fi

    # Check for operating system
    if [ ! -f /usr/bin/sok-find-os ]; then
        echo "/usr/bin/sok-find-os not found"
        exit 1
    fi

    SOK_OS=$(/usr/bin/sok-find-os)

    # If os not found just exit the script
    if [ $SOK_OS == "ERROR" ]; then
        cat /etc/*release
        echo -e "\nOS NOT SUPPORTED.\n"
        echo -e "Contact me on twitter/X (https://twitter.com/serverokin) to add support for your OS.\n"
        exit 1;
    fi
}

install_command_script(){
    /usr/bin/wget -q --no-check-certificate -O /usr/bin/sok-find-os https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/sok-find-os.sh > /dev/null 2>&1
    chmod 755 /usr/bin/sok-find-os

    /usr/bin/wget -q --no-check-certificate -O /usr/bin/squid-uninstall https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid-uninstall.sh > /dev/null 2>&1
    chmod 755 /usr/bin/squid-uninstall

    /usr/bin/wget -q --no-check-certificate -O /usr/bin/squid-add-user https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid-add-user.sh > /dev/null 2>&1
    chmod 755 /usr/bin/squid-add-user

}

apt_update_install(){
    # Update for Debian/Ubuntu based linux
    /usr/bin/apt update > /dev/null 2>&1
    /usr/bin/apt -y install "$@" > /dev/null 2>&1
}

config_setup(){
    # Write squid configuration files
    # First argument is the configuration file URL
    local config_url="$1"

    # Determine the base directory for Squid
    if [ -d "/etc/squid3" ]; then
        local squid_dir="/etc/squid3"
    else
        local squid_dir="/etc/squid"
    fi

    touch "$squid_dir/passwd"
    mv "$squid_dir/squid.conf" "$squid_dir/squid.conf.bak"
    /usr/bin/touch "$squid_dir/blacklist.acl"

    # Use the provided URL, or a default URL if none is passed
    /usr/bin/wget -q --no-check-certificate -O "$squid_dir/squid.conf" ${config_url:-https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid.conf}
}

setup_firewall(){
    # Open 3128 port for squid service
    if [ -f /sbin/iptables ]; then
        /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
        /sbin/iptables-save
    fi
}

setup_firewall_centos(){
    # Open 3128 port for squid service
    if [ -f /usr/bin/firewall-cmd ]; then
        firewall-cmd --zone=public --permanent --add-port=3128/tcp > /dev/null 2>&1
        firewall-cmd --reload > /dev/null 2>&1
    fi
}

# Restarting squid
restart_squid(){
    if command -v systemctl &>/dev/null; then
        systemctl enable squid  > /dev/null 2>&1
        systemctl restart squid
    else
        systemctl enable squid  > /dev/null 2>&1
        service squid restart
    fi
}

install_squid(){
    if [ $SOK_OS == "ubuntu2404" ] || [ $SOK_OS == "ubuntu2204" ]; then
        apt_update_install "apache2-utils" "squid"
        config_setup "https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/conf/ubuntu-2204.conf"
        setup_firewall
        restart_squid

    elif [ $SOK_OS == "ubuntu2004" ]; then
        apt_update_install "apache2-utils" "squid"
        config_setup
        setup_firewall
        restart_squid

    elif [ $SOK_OS == "ubuntu1804" ]; then
        apt_update_install "apache2-utils" "squid3"
        config_setup
        setup_firewall
        restart_squid

    elif [ $SOK_OS == "ubuntu1604" ]; then
        apt_update_install "apache2-utils" "squid3"
        config_setup
        setup_firewall
        service squid restart
        update-rc.d squid defaults

    elif [ $SOK_OS == "ubuntu1404" ]; then
        apt_update_install "apache2-utils" "squid3"
        config_setup
        setup_firewall
        service squid3 restart
        ln -s /etc/squid3 /etc/squid
        #update-rc.d squid3 defaults
        ln -s /etc/squid3 /etc/squid

    elif [ $SOK_OS == "debian8" ]; then
        # OS = Debian 8
        apt_update_install "apache2-utils" "squid3"
        config_setup
        setup_firewall
        service squid3 restart
        update-rc.d squid3 defaults
        ln -s /etc/squid3 /etc/squid

    elif [ $SOK_OS == "debian11" ] || [ $SOK_OS == "debian10" ] || [ $SOK_OS == "debian9" ]; then
        apt_update_install "apache2-utils" "squid"
        config_setup
        setup_firewall
        restart_squid

    elif [ $SOK_OS == "debian12" ]; then
        # OS = Debian GNU/Linux 12 (bookworm)
        apt_update_install "apache2-utils" "squid"
        config_setup "https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/conf/debian12.conf"
        setup_firewall
        restart_squid

    elif [ $SOK_OS == "centos7" ]; then
        echo "CentOS Linux 7 reached End of Life (EOL) nn June 30, 2024. Please use to newer OS"
        exit 1
    elif [ "$SOK_OS" == "centos8" ] || [ "$SOK_OS" == "almalinux8" ] || [ "$SOK_OS" == "almalinux9" ]; then
        yum install squid httpd-tools wget -y
        config_setup "https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/conf/squid-centos7.conf"
        restart_squid
        setup_firewall_centos

    elif [ "$SOK_OS" == "centos9" ] || [ "$SOK_OS" == "centos8s" ]; then
        dnf install squid httpd-tools wget -y > /dev/null 2>&1
        config_setup "https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/conf/squid-centos7.conf"
        restart_squid
        setup_firewall_centos
    fi
}

# Main functions 
install_command_script
checks
echo -e "Installing squid on ${SOK_OS}, please wait....\n"
install_squid


GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${NC}"
echo -e "${GREEN}Thank you for using ServerOk Squid Proxy Installer.${NC}"
echo
echo -e "${CYAN}To create a proxy user, run command: squid-add-user${NC}"
echo -e "${CYAN}To change squid proxy port, see ${GREEN}https://serverok.in/how-to-change-port-of-squid-proxy-server${NC}"
echo -e "${NC}"
