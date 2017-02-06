# ubuntu-squid3

Auto install Squid 3 proxy on Ubuntu 16.04 or better.

# ubuntu-squid3

Auto install Squid 3 proxy on Ubuntu 16.04 or better.

## Before you Run

Edit squid3-install.sh, find line

```
/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
```

In that replace USERNAME_HERE with your desired user name and PASSWORD_HERE with your own password.

## Install

To install, run the script

```
sudo ./squid3-install.sh
```