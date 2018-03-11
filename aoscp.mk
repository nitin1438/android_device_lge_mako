$(call inherit-product, vendor/aoscp/configs/common_full_phone.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aoscp/configs/telephony.mk)

# Inherit AOSP device configuration for mako
$(call inherit-product, device/lge/mako/full_mako.mk)

# Setup device specific product configuration
PRODUCT_NAME := aoscp_mako
PRODUCT_BRAND := google
PRODUCT_DEVICE := mako
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=occam BUILD_FINGERPRINT=google/occam/mako:5.1.1/LMY48M/2167285:user/release-keys \
   PRIVATE_BUILD_DESC="occam-user 5.1.1 LMY48M 2167285 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
