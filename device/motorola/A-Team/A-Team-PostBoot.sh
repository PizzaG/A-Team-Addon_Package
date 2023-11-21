#!/system/bin/sh

#
# Copyright 2019-Present A-Team Digital Solutions
#

sleep 10

# Set SeLinux Permissive
su -c setenforce 0

sleep 10

# A-Team Dynamic R/W
su -c mount --remount / -w 
su -c mount -o remount,rw /product
su -c mount -o remount,rw /system_ext
su -c mount -o remount,rw /vendor
su -c remount

sleep 20

# A-Team USB MTP Boot Enabler
svc usb setFunctions mtp

exit
