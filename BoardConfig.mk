#
# Copyright (C) 2011 The Android Open-Source Project
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from vendor
-include vendor/lge/mako/BoardConfigVendor.mk

# Platform Path
PLATFORM_PATH := device/lge/mako

# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

# Kernel
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_IMAGE_NAME = zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=mako lpj=67677 user_debug=31 vmalloc=340M
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000
TARGET_KERNEL_SOURCE := kernel/lge/mako
TARGET_KERNEL_CONFIG := lineageos_mako_defconfig

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := MAKO
TARGET_BOOTLOADER_NAME := mako

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Security patch level
VENDOR_SECURITY_PATCH := 2015-09-08

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
AUDIO_FEATURE_ENABLED_FLUENCE := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth

# WCNSS
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Wi-Fi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

# Display
TARGET_USES_ION := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1333788672 # 1272M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6189744128 # 5.9G
BOARD_CACHEIMAGE_PARTITION_SIZE := 738197504 # 704 MByte
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# Encryption
TARGET_KEYMASTER_SKIP_WAITING_FOR_QSEE := true

# Release tools
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)

# SeLinux Policy
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true

TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/cameraserver=22 \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22

# Text Relocations
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Healthd
BOARD_CHARGER_ENABLE_SUSPEND := true

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.mako

# Device manifest
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(PLATFORM_PATH)/compatibility_matrix.xml
