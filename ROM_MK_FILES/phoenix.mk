#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# All components inherited here go to product image
$(call inherit-product, vendor/phoenix/build/product/phoenix_product.mk)

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# phoenix Required Packages
PRODUCT_PACKAGES += libtensorflowlite_jni

# phoenix Official Rel Extras
#$(call inherit-product-if-exists, vendor/phoenix-priv/phoenix-priv.mk)

PRODUCT_NAME := phoenix_$(DEVICE)
