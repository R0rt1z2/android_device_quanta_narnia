DEVICE_DIR := device/quanta/narnia
VENDOR_DIR := vendor/quanta/narnia
VENDOR_MT8127 := vendor/mediatek/mt8127

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(DEVICE_DIR)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Copy the kernel to rootdir
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# Get non-open-source specific aspects
$(call inherit-product-if-exists, $(VENDOR_DIR)/narnia-vendor.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_DIR)/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Disable Strict Mode (only for eng builds)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

# Device is a tablet and doesn't has RIL/SIM
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=1 \
    ro.radio.use-ppp=no \
    ro.config.nocheckin=yes \
    ro.radio.noril=1 \
    ro.carrier=wifi-only \
    persist.radio.noril=1

# GPS
PRODUCT_COPY_FILES += \
     $(DEVICE_DIR)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# Rootdir/Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/rootdir/init.mt8127.rc:root/init.mt8127.rc \
    $(DEVICE_DIR)/rootdir/init.mt8127.usb.rc:root/init.mt8127.usb.rc \
    $(DEVICE_DIR)/rootdir/init.aee.rc:root/init.aee.rc \
    $(DEVICE_DIR)/rootdir/init.ssd.rc:root/init.ssd.rc \
    $(DEVICE_DIR)/rootdir/init.project.rc:root/init.project.rc \
    $(DEVICE_DIR)/rootdir/init.charging.rc:root/init.charging.rc \
    $(DEVICE_DIR)/rootdir/ueventd.mt8127.rc:root/ueventd.mt8127.rc \
    $(DEVICE_DIR)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(DEVICE_DIR)/rootdir/meta_init.rc:root/meta_init.rc \
    $(DEVICE_DIR)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(DEVICE_DIR)/rootdir/factory_init.rc:root/factory_init.rc \
    $(DEVICE_DIR)/rootdir/enableswap.sh:root/enableswap.sh

# Debug Boot
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/rootdir/sbin/busybox:root/sbin/busybox \
    $(DEVICE_DIR)/rootdir/sbin/log_kmsg:root/sbin/log_kmsg \
    $(DEVICE_DIR)/rootdir/sbin/sh:root/system/bin/sh

# Media codecs files that are not copied from stock rom
PRODUCT_COPY_FILES += \
	$(DEVICE_DIR)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(DEVICE_DIR)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Bluetooth config files
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(DEVICE_DIR)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml

# Wifi config files
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_DIR)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(DEVICE_DIR)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Hostapd Config Files
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(DEVICE_DIR)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(DEVICE_DIR)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Audio policy
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio_policy.default \
	audio_policy.stub \
	audio.r_submix.default \
	audio.usb.default \
	audio.primary.default \
	libaudio-resampler
    
# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default \
    libbt-vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf

# Power
PRODUCT_PACKAGES += \
	power.default

# Network
PRODUCT_PACKAGES += \
    netd
    
# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# ROOT access
PRODUCT_PACKAGES += \
	su

# MediaTek Shims
PRODUCT_PACKAGES += \
   libshim_egl \
   libshim_hwc \
   libshim_audio \
   libxlog

# Call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# call hwui memory config		
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
