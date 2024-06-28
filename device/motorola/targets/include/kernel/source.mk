#
# (C) 2019-Present A-Team Digital Solutions
# (C) 2024 Electimon
#

include device/motorola/targets/include/kernel/common.mk

# A-Team Clang Version Selector
ifeq ($(call is-kernel-greater-than-or-equal-to,5.10),true)
  TARGET_KERNEL_NO_GCC := true
else ifeq ($(call is-kernel-less-than-or-equal-to,5.4),true)
    TARGET_KERNEL_LLVM_BINUTILS := true
    # Android 13
    ifeq ($(ANDROID_VERSION), 13)
    TARGET_KERNEL_CLANG_VERSION := r450784d
    endif
    # Android 14
    ifeq ($(ANDROID_VERSION), 14)
    TARGET_KERNEL_CLANG_VERSION := r450784e
    endif
else
    TARGET_KERNEL_CLANG_VERSION := r383902
    TARGET_KERNEL_LLVM_BINUTILS := false
endif

TARGET_KERNEL_NO_GCC ?= false
TARGET_KERNEL_CONFIG := vendor/$(DEVICE)_defconfig

ifeq ($(TARGET_USES_DTB_FROM_SOURCE),false)
  BOARD_PREBUILT_DTBIMAGE_DIR := device/motorola/$(DEVICE)-kernel/dtbs
  ifeq ($(call has-partition,dtbo),true)
    BOARD_PREBUILT_DTBOIMAGE := device/motorola/$(DEVICE)-kernel/dtbo.img
  endif
endif
ifeq ($(PRODUCT_USES_QCOM_HARDWARE),true)
  ifeq ($(DEVICE_NAME), Borneo)
      TARGET_KERNEL_SOURCE := kernel/motorola/msm-$(TARGET_KERNEL_VERSION)-borneo
      PRODUCT_SOONG_NAMESPACES += \
          [$(DEVICE_NAME)_$(TARGET_KERNEL_VERSION)_Kernel]
  else ifeq ($(DEVICE_NAME), Hanoip)
      TARGET_KERNEL_SOURCE := kernel/motorola/msm-$(TARGET_KERNEL_VERSION)-hanoip
      PRODUCT_SOONG_NAMESPACES += \
          [$(DEVICE_NAME)_$(TARGET_KERNEL_VERSION)_Kernel]
  else
      TARGET_KERNEL_SOURCE := kernel/motorola/msm-$(TARGET_KERNEL_VERSION)
      PRODUCT_SOONG_NAMESPACES += \
          [$(DEVICE_NAME)_$(TARGET_KERNEL_VERSION)_Kernel]
  endif
else ifeq ($(PRODUCT_USES_MTK_HARDWARE),true)
  TARGET_KERNEL_SOURCE := kernel/motorola/$(TARGET_BOARD_PLATFORM)
else
  $(warning Target's Hardware Is Not Supported...)
endif
