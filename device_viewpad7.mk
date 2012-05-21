$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_ww_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/viewsonic/viewpad7/overlay


# HAL libs and other system binaries
PRODUCT_PACKAGES += \
                hwprops \
                copybit.msm7k \
                gps.viewpad7 \
                abtfilt \
                lights.viewpad7 \
                gralloc.viewpad7 \
                libOmxCore 
                
                          
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/viewsonic/viewpad7/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
PRODUCT_PACKAGES += \
                LiveWallpapers \
                LiveWallpapersPicker \
                MagicSmokeWallpapers \
                VisualizationWallpapers \
                librs_jni \

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/viewsonic/viewpad7/prebuilt/init.qcom.rc:root/init.qcom.rc \
    device/viewsonic/viewpad7/prebuilt/ueventd.qct.rc:root/ueventd.qct.rc 
 

## Hardware properties 
PRODUCT_COPY_FILES += \
 frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# init scripts
PRODUCT_COPY_FILES += \
    device/viewsonic/viewpad7/prebuilt/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/viewsonic/viewpad7/prebuilt/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh 
    

PRODUCT_COPY_FILES += \
    device/viewsonic/viewpad7/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    device/viewsonic/viewpad7/prebuilt/etc/loc_parameter.ini:/system/etc/loc_parameter.ini \
    device/viewsonic/viewpad7/prebuilt/ms3c_transformation.cfg:system/etc/ms3c_transformation.cfg \
    device/viewsonic/viewpad7/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/viewsonic/viewpad7/prebuilt/bin/port-bridge:system/bin/port-bridge \
    device/viewsonic/viewpad7/prebuilt/ms3c_charger_offset.cfg:system/etc/ms3c_charger_offset.cfg \
    device/viewsonic/viewpad7/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv 
   

PRODUCT_COPY_FILES += \
    device/viewsonic/viewpad7/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/viewsonic/viewpad7/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/viewsonic/viewpad7/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/viewsonic/viewpad7/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
device/viewsonic/viewpad7/prebuilt/GooManager.apk:system/app/GooManager.apk \
    device/viewsonic/viewpad7/prebuilt/7x27_kybd.kl:system/usr/keylayout/7x27_kybd.kl  
     

    ## Atheros AR6002 firmware
PRODUCT_COPY_FILES += \
    device/viewsonic/viewpad7/firmware/data.patch.hw2_0.bin:system/etc/firmware/data.patch.hw2_0.bin \
    device/viewsonic/viewpad7/firmware/eeprom.bin:system/etc/firmware/eeprom.bin \
    device/viewsonic/viewpad7/firmware/calData_ar6102_15dBm.bin:system/etc/firmware/calData_ar6102_15dBm.bin \
    device/viewsonic/viewpad7/firmware/athwlan.bin.z77:system/etc/firmware/athwlan.bin.z77 \
    device/viewsonic/viewpad7/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Performance & graphics properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m \
    ro.opengles.version=131072 
   
#GooManager Support:
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=mb-14 \
    ro.goo.rom=CM7Viewpad7 \
    ro.goo.board=viewpad7 \
    ro.goo.version=$(shell date +%s)

$(call inherit-product, build/target/product/full_base.mk)

$(call inherit-product-if-exists, vendor/viewsonic/viewpad7/viewpad7-vendor.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := viewpad7
PRODUCT_DEVICE := viewpad7
PRODUCT_MODEL := viewsonic viewpad7
