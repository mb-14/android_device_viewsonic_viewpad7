# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_ww_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/fih/fm6/overlay


# HAL libs and other system binaries
PRODUCT_PACKAGES += \
                hwprops \
                copybit.msm7k \
                gps.fm6 \
                abtfilt \
                gralloc.fm6 \
                libOmxCore 
                
                          
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/fih/fm6/kernel
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
    device/fih/fm6/prebuilt/init.qcom.rc:root/init.qcom.rc \
    device/fih/fm6/prebuilt/ueventd.qct.rc:root/ueventd.qct.rc 

# Gsensor &Ecompass
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/app/GSensorCalibration.apk:/system/app/GSensorCalibration.apk 

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
 frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml



# init scripts
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    device/fih/fm6/prebuilt/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh 
    

PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    device/fih/fm6/prebuilt/etc/loc_parameter.ini:/system/etc/loc_parameter.ini \
    device/fih/fm6/prebuilt/ms3c_transformation.cfg:system/etc/ms3c_transformation.cfg \
    device/fih/fm6/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/fih/fm6/prebuilt/bin/port-bridge:system/bin/port-bridge \
    device/fih/fm6/prebuilt/ms3c_charger_offset.cfg:system/etc/ms3c_charger_offset.cfg \
    device/fih/fm6/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv 
   

PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/fih/fm6/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/fih/fm6/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/fih/fm6/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/fih/fm6/prebuilt/7x27_kybd.kl:system/usr/keylayout/7x27_kybd.kl 


    ## Atheros AR6002 firmware
PRODUCT_COPY_FILES += \
    device/fih/fm6/firmware/data.patch.hw2_0.bin:system/etc/firmware/data.patch.hw2_0.bin \
    device/fih/fm6/firmware/eeprom.bin:system/etc/firmware/eeprom.bin \
    device/fih/fm6/firmware/calData_ar6102_15dBm.bin:system/etc/firmware/calData_ar6102_15dBm.bin \
    device/fih/fm6/firmware/athwlan.bin.z77:system/etc/firmware/athwlan.bin.z77 \
    device/fih/fm6/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Performance & graphics properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=48m \
    ro.opengles.version=131072 \

$(call inherit-product, build/target/product/full_base.mk)

$(call inherit-product-if-exists, vendor/fih/fm6/fm6-vendor.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := fm6
PRODUCT_DEVICE := fm6
PRODUCT_MODEL := Fih fm6
PRODUCT_MANUFACTURER := fih
