#!/system/bin/sh

#
# Copyright 2019-Present A-Team Digital Solutions
#

# A-Team Magisk & Post-Setup Auto Detection
if [ -f /data/cache/Lock_Magisk.a-team ]; then 
exit
else

# Move Magisk Lock File To Data
su -c cp -r /product/A-Team_TMP/Lock_Magisk.a-team /data/cache/Lock_Magisk.a-team

# Move A-Team Lock File To Data
su -c cp -r /product/A-Team_TMP/Lock.a-team /data/cache/Lock.a-team

# Set 3 Button Navigation
su -c cmd overlay enable com.android.internal.systemui.navbar.threebutton

# Set Screen TimeOut 30 Minutes
su -c settings put system screen_off_timeout 1800000

# Set Device Provisioned
su -c settings put global device_provisioned 1

# Magisk Post-Install Setup
su -c cp -r /product/A-Team_TMP/adb /data

# Install Nova Launcher
pm install -r "/product/A-Team_TMP/Apps/NovaLauncher.apk"

# Install Magisk Manager
pm install -r "/product/A-Team_TMP/Apps/Magisk.apk"

# Magisk Post-Install Setup
su -c cp -r /product/A-Team_TMP/adb /data

sleep 1

# Reboot
reboot 

fi
