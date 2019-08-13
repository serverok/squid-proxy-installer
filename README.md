# squid-proxy-installer

Auto install Squid 3 proxy on

Ubuntu 14.04
Ubuntu 16.04
Debian 8
Debian 9
Debian 10

## Install Squid

To install, run the script

```
wget https://raw.githubusercontent.com/serverok/squid/master/squid3-install.sh
chmod 755 squid3-install.sh
sudo ./squid3-install.sh
```

# Configure Multiple IP Address

Before you can configure squid to use muliple IP address, you need to add IP to your server.

Once IP added to your server, you can configure it to use with squid proxy by running following command

```
wget https://raw.githubusercontent.com/serverok/squid/master/squid-conf-ip.sh && bash squid-conf-ip.sh
```

# Create Users

To create users, run

```
/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
```

To update password for am existing user, run

```
/usr/bin/htpasswd /etc/squid/passwd USERNAME_HERE
```

replace USERNAME_HERE and PASSWORD_HERE with your desired user name and password.
