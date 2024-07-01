#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common derp stuff
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Derp Build Flags
DERP_BUILDTYPE := UnOfficial
USE_LEGACY_BOOTANIMATION := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_INCLUDE_LIVE_WALLPAPERS := false

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := derp_$(DEVICE)
