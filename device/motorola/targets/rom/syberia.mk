#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common syberia stuff.
$(call inherit-product, vendor/syberia/common.mk)

# Syberia Build Flags
SYBERIA_BUILD_TYPE := UNOFFICIAL
TARGET_INCLUDE_PIXEL_CHARGER := true
EXTRA_UDFPS_ANIMATIONS := false
TARGET_FACE_UNLOCK_SUPPORTED := true

# Gapps
WITH_GMS=true
TARGET_GAPPS_ARCH := arm64

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := syberia_$(DEVICE)

