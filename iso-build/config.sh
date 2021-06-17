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
# Mount system filesystems
#--------------------------------------
baseMount

#======================================
# Activate services
#--------------------------------------
baseInsertService ssh

#======================================
# Setup default target, multi-user
#--------------------------------------
baseSetRunlevel 3

#======================================
# Generate locale
#--------------------------------------
locale-gen "${kiwi_language}.UTF-8"

#======================================
# Force localhost for hostname
#--------------------------------------
echo "localhost" > /etc/hostname

#======================================
# Umount kernel filesystems
#--------------------------------------
baseCleanMount

exit 0
