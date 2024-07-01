#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/prebuilt.mk)

# Avoid double inclusion
ROM_INCLUDES_QCOM_COMMON := true

# Bluetooth
PRODUCT_SOONG_NAMESPACES += \
    packages/modules/Bluetooth/android/app

PRODUCT_NAME := aospa_$(DEVICE)
