#
# Copyright 2019-Present A-Team Digital Solutions
#

A_TEAM_PATH := device/motorola/A-Team

# A-Team Custom NameSpaces
PRODUCT_SOONG_NAMESPACES += \
    [A-Team_Mods] \
    [A-Team_Apps]

# BootAnimation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# Device Maintainer
DEVICE_MAINTAINER := PizzaG

# Magisk Patching
ifeq ($(A_TEAM_MAGISK), true)
PRODUCT_SOONG_NAMESPACES += \
    [A-Team_Magisk]
endif

ifeq ($(MICROG), true)
PRODUCT_SOONG_NAMESPACES += \
     [$A-Team_MICRO-G]
$(call inherit-product, vendor/microg/products/gms.mk)
endif

# Copy APN
#ifeq ($(CUSTOM_APN), true)
#PRODUCT_COPY_FILES += \
#    $(A_TEAM_PATH)/Custom_APN/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml
#endif


####################
## A-Team Add-Ons ##
##################################################################

# Custom Wallpaper
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(A_TEAM_PATH)/wallpapers,product/media/wallpapers)

PRODUCT_PRODUCT_PROPERTIES += \
	ro.config.wallpaper=product/media/wallpapers/default_moto_wallpaper.jpg 

# Copy A-Team Custom rc Files - /product/etc/init
PRODUCT_COPY_FILES += \
    $(A_TEAM_PATH)/a.team.postboot.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/a.team.postboot.rc \
    $(A_TEAM_PATH)/a.team.tmp.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/a.team.tmp.rc \
    $(A_TEAM_PATH)/a.team.magisk.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/a.team.magisk.rc

# Copy A-Team Custom sh Files - /product/bin 
PRODUCT_COPY_FILES += \
    $(A_TEAM_PATH)/A-Team-PostBoot.sh:$(TARGET_COPY_OUT_PRODUCT)/bin/A-Team-PostBoot.sh \
    $(A_TEAM_PATH)/A-Team_TMP.sh:$(TARGET_COPY_OUT_PRODUCT)/bin/A-Team_TMP.sh \
    $(A_TEAM_PATH)/A-Team_Magisk.sh:$(TARGET_COPY_OUT_PRODUCT)/bin/A-Team_Magisk.sh

# Copy Busybox - /system/bin
PRODUCT_COPY_FILES += \
    $(A_TEAM_PATH)/Busybox/arm64/busybox:$(TARGET_COPY_OUT_SYSTEM)/bin/busybox \
    $(A_TEAM_PATH)/Busybox/arm64/ssl_helper:$(TARGET_COPY_OUT_SYSTEM)/bin/ssl_helper

# Clock 
PRODUCT_COPY_FILES += \
    $(A_TEAM_PATH)/Prerequisites/Clock.prop:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/Clock.prop

# Messages 
PRODUCT_COPY_FILES += \
    $(A_TEAM_PATH)/Prerequisites/com.google.android.apps.messaging.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.apps.messaging.xml

# System Prop Additions
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.adb.notify=0 \
    persist.sys.disable_rescue=true \
    ro.a-team.rom_version=$(VERSION)
