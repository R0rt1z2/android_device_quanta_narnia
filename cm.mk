# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/quanta/narnia/full_narnia.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := narnia
PRODUCT_NAME := cm_narnia
PRODUCT_BRAND := google
PRODUCT_MODEL := narnia
PRODUCT_MANUFACTURER := quanta

# Release name
PRODUCT_RELEASE_NAME := narnia

# Screen Resolution
TARGET_SCREEN_WIDTH := 1024
TARGET_SCREEN_HEIGHT := 600

