# ubuntu-squid3

Auto install Squid 3 proxy on Ubuntu 16.04 or better.

# ubuntu-squid3

Auto install Squid 3 proxy on Ubuntu 16.04 or better.

## Install

To install, run the script

```
wget https://raw.githubusercontent.com/HostOnNet/ubuntu-squid3/master/squid3-install.sh
chmod 755 squid3-install.sh
sudo ./squid3-install.sh
```

# Create Users

To create users, run

```
/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
```

replace USERNAME_HERE and PASSWORD_HERE with your desired user name and password.
