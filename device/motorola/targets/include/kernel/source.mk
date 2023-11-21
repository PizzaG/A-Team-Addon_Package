#
# (C) 2019-Present A-Team Digital Solutions
# (C) 2023 Electimon
#

# A-Team Clang Version Selector
ifeq ($(call is-kernel-greater-than-or-equal-to, 5.4),true)
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

# A-Team Kernel Auto Selector
ifeq ($(DEVICE_NAME), Borneo)
    TARGET_KERNEL_SOURCE := kernel/motorola/msm-$(TARGET_KERNEL_VERSION)-borneo
    TARGET_KERNEL_CONFIG := vendor/$(DEVICE)_defconfig
    PRODUCT_SOONG_NAMESPACES += \
        [$(DEVICE_NAME)_$(TARGET_KERNEL_VERSION)_Kernel]
else
    TARGET_KERNEL_SOURCE := kernel/motorola/msm-$(TARGET_KERNEL_VERSION)
    TARGET_KERNEL_CONFIG := vendor/$(DEVICE)_defconfig
    PRODUCT_SOONG_NAMESPACES += \
        [$(DEVICE_NAME)_$(TARGET_KERNEL_VERSION)_Kernel]
endif




