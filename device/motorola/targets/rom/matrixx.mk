#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Matrixx
MATRIXX_BUILD_TYPE := Unofficial
MATRIXX_MAINTAINER := PizzaG
WITH_GAPPS := true

# Auto Matrixx Device Selection
ifeq ($(DEVICE_NAME),Amogus)
    MATRIXX_CHIPSET := SM6125
    MATRIXX_BATTERY := 4000mAh
    MATRIXX_DISPLAY := 1080x2300
else ifeq ($(DEVICE_NAME),Borneo)
    MATRIXX_CHIPSET := SM6115
    MATRIXX_BATTERY := 5000mAh
    MATRIXX_DISPLAY := 1080x2400
else ifeq ($(DEVICE_NAME),Guamna)
    MATRIXX_CHIPSET := SM4250
    MATRIXX_BATTERY := 5000mAh
    MATRIXX_DISPLAY := 1080x2400
else ifeq ($(DEVICE_NAME),Milanf)
    MATRIXX_CHIPSET := SM6375
    MATRIXX_BATTERY := 5000mAh
    MATRIXX_DISPLAY := 1080x2460
else ifeq ($(DEVICE_NAME),Osaka)
    MATRIXX_CHIPSET := SM4350
    MATRIXX_BATTERY := 5000mAh
    MATRIXX_DISPLAY := 1080x2400
endif

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := lineage_$(DEVICE)
