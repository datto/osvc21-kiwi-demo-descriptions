#!/bin/bash
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Setup default target, multi-user
#--------------------------------------
systemctl set-default multi-user.target

#======================================
# Set up the user skeleton for root user
#--------------------------------------
cp -a /etc/skel/* /root/

#======================================
# Force localhost for hostname
#--------------------------------------
echo "localhost" > /etc/hostname

#======================================
# Purge unwanted locales
#--------------------------------------
rm -rf /usr/share/locale/*/*/*.mo
rm -rf /usr/share/X11/locale/*/*
find /usr/share/i18n/charmaps -type f -not -name 'UTF-8.*' -delete
find /usr/share/i18n/locales -type f -not -name 'en*' -delete
