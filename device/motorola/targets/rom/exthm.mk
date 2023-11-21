#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common exTHmUI stuff.
$(call inherit-product, vendor/exthm/config/phone.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := exthm_$(DEVICE)
