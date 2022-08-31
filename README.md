# Squid Proxy Installer

https://serverok.in/squid

Auto install Squid 3 proxy on following linux OS.

* Ubuntu 14.04, 16.04, 18.04, 20.04, 22.04
* Debian 8, 9, 10
* CentOS 7, 8


## Install Squid

To install, run the script

```
wget https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid3-install.sh -O squid3-install.sh
sudo bash squid3-install.sh
```

## Videos - How to install Squid Proxy Server.

[![How to install Squid Proxy Server in DigitalOcean VPS](https://i.imgur.com/eGt5nmB.png)](https://rumble.com/vdswgv-install-squid-proxy-server-in-digitalocean-vps.html)

https://rumble.com/vdswgv-install-squid-proxy-server-in-digitalocean-vps.html

https://odysee.com/squid-proxy-install:1


# Create Users

To create users, run

```
squid-add-user
```

OR run following commands

```
sudo /usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
```

To update password for am existing user, run

```
sudo /usr/bin/htpasswd /etc/squid/passwd USERNAME_HERE
```

replace USERNAME_HERE and PASSWORD_HERE with your desired user name and password.

Reload squid proxy

```
sudo systemctl reload squid
```

# Configure Multiple IP Address

NOTE: This is only needed if you have more than one IP on your server.

Before you can configure squid to use muliple IP address, you need to add IP to your server and you should be able to connect to server using these IPs.

Once IP added to your server, you can configure it to use with squid proxy by running following command

```
wget https://raw.githubusercontent.com/serverok/squid-proxy-installer/master/squid-conf-ip.sh
sudo bash squid-conf-ip.sh
```

# Change Squid Proxy Port

https://serverok.in/how-to-change-port-of-squid-proxy-server

# Support

If you are looking for paid support, contact me

https://serverok.in/contact
