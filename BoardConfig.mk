#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oplus/ossi

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS +=
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := cortex-a78
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Board Platform
TARGET_BOARD_PLATFORM := mt6833
BOARD_HAS_MTK_HARDWARE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k6833v1_64_k419
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 320

# Enable boot variables and AEE feature
BOARD_USES_EMMC_BOOT := true
BOARD_USES_MTK_AEE_FEATURE := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 #TODO: buildvariant=
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := ossi_defconfig
TARGET_KERNEL_SOURCE := kernel/oplus/ossi
# kernel and kernel module github repositories
#
# https://github.com/OnePlusOSS/android_kernel_oneplus_mt6833
# https://github.com/OnePlusOSS/android_kernel_modules_oneplus_mt6833
#
# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Set networking configurations
BOARD_HAS_WIFI := true
BOARD_WIFI_DEVICE_ENG := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 2875392
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := oplus_dynamic_partitions
BOARD_OPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST :=
BOARD_OPLUS_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.enableswap
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Specify the default orientation
BOARD_DEFAULT_ORIENTATION := portrait

# Set the default locale
BOARD_DEFAULT_LANGUAGE := en
BOARD_DEFAULT_REGION := US

# Specify the supported locales
BOARD_AVAILABLE_LOCATIONS := en_US

# Set the default time zone
BOARD_DEFAULT_TIMEZONE := America/Chicago

# Specify the system user and group
BOARD_SYSTEM_USER := system
BOARD_SYSTEM_GROUP := system

# Set the target user
BOARD_USER := user
BOARD_USERIMAGES_USE_SYSTEM := true

# Set the build-specific properties
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_BUILD_USERDATAIMAGE := true

# Specify the boot and recovery image build properties
BOARD_BUILD_BOOTIMAGE := true
BOARD_BUILD_RECOVERYIMAGE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Set the OEM unlock support
BOARD_HAS_OEMLOCK := true

# Specify the platform-specific flags
TARGET_BOARD_PLATFORM_MTK := true

# Specify the graphics memory allocation
BOARD_GRALLOC_ION := true

# Specify security configurations
BOARD_SUPPORTS_FILE_ENCRYPTION := true
BOARD_SUPPORTS_FULL_DISK_ENCRYPTION := true

# Specify USB configurations
BOARD_USB_MTP := true
BOARD_USB_PTP := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# VNDK
BOARD_VNDK_VERSION := current

# set Vulkan configurations
BOARD_VULKAN := true
BOARD_USES_VULKAN := true

# Inherit the proprietary files
include vendor/oplus/ossi/BoardConfigVendor.mk
