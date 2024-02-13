#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

DEVICE_PATH := device/xiaomi/lavender

# PRODUCT_SHIPPING_API_LEVEL indicates the first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 28

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libstdc++_vendor

# Consumerir
BOARD_HAVE_IR := true

# Dynamic partitions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/partitions/flash_super_dummy.sh:install/bin/flash_super_dummy.sh

# FM
BOARD_HAVE_QCOM_FM := true

# Overlays
PRODUCT_PACKAGES += \
    LavenderFrameworksBase \
    LavenderSystemUIOverlay \
    NoCutoutOverlay \
    NotchBarKiller

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom_ramdisk \
    init.device.rc

# Shims
PRODUCT_PACKAGES += \
    libcamera_sdm660_shim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Wifi
PRODUCT_PACKAGES += \
    LavenderWifiOverlay

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/lavender/lavender-vendor.mk)
