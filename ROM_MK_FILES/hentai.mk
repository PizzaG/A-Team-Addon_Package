#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# All components inherited here go to system image
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system.mk)

# All components inherited here go to system_ext image
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# All components inherited here go to product image
$(call inherit-product, vendor/hentai/build/product/hentai_product.mk)

# All components inherited here go to vendor image
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Hentai Required Packages
PRODUCT_PACKAGES += libtensorflowlite_jni

# Hentai Official Rel Extras
$(call inherit-product-if-exists, vendor/hentai-priv/hentai-priv.mk)

PRODUCT_NAME := hentai_$(DEVICE)
