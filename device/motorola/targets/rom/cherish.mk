#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common CherishOS Stuff.
$(call inherit-product, vendor/cherish/config/common.mk)

# CherishOS Stuff with GApps
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_BUILD_GRAPHENEOS_CAMERA := false
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_ENABLE_BLUR := false
WITH_GMS := true

# FOD animations
EXTRA_UDFPS_ANIMATIONS := false

# Maintainer Stuff
CHERISH_BUILD_TYPE := UNOFFICIAL
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cherish.maintainer=PizzaG

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# VARIABLE - SePolicy Camera Script
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := cherish_$(DEVICE)
