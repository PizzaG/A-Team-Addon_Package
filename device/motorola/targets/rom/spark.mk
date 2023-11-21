#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Requirements For Spark To Boot
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# Inherit some common Spark-OS stuff.
$(call inherit-product, vendor/spark/config/common_full_phone.mk)

# Spark Build Flags
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := true
EXTRA_UDFPS_ANIMATIONS := false
TARGET_USES_AOSP_RECOVERY := true
SPARK_BUILD_TYPE := UNOFFICIAL

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

# Gapps
WITH_GAPPS := true

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := spark_$(DEVICE)

