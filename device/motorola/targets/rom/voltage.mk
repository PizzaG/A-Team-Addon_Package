#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

# Common
include device/motorola/targets/include/common.mk

# Inherit some common Voltage OS stuff.
$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

# VoltageOS Build Flags
VOLTAGE_BUILD_TYPE := UNOFFICIAL
VOLTAGE_MAINTAINER := PizzaG

# Kernel
$(call inherit-product, device/motorola/targets/include/kernel/source.mk)

# Required Scripts
$(warning This ROM requires replace_camera_sepolicy.sh to be ran...)

PRODUCT_NAME := voltage_$(DEVICE)
