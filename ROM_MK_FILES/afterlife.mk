#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2024 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Inherit some common Afterlife stuff.
$(call inherit-product, vendor/afterlife/config/common_full_phone.mk)

# AfterLife stuff
AFTERLIFE_GAPPS := true
AFTERLIFE_MAINTAINER := 
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_BLUR := true
USE_PIXEL_CHARGING := true

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_USES_AOSP_RECOVERY := true
TARGET_SUPPORTS_QUICK_TAP := true

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := afterlife_$(DEVICE)
