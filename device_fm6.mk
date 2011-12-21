# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/fih/fm6/overlay


# HAL libs and other system binaries
PRODUCT_PACKAGES += \
                hwprops \
                copybit.fm6 \
                gralloc.fm6 \
                gps.fm6 \
                abtfilt \
                libOmxVidEnc \
                libOmxCore
                          
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/fih/fm6/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/init.qcom.rc:root/init.qcom.rc \
    device/fih/fm6/prebuilt/ueventd.qcom.rc:root/ueventd.qcom.rc 

# Gsensor &Ecompass
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/app/GSensorCalibration.apk:/system/app/GSensorCalibration.apk \
    device/fih/fm6/prebuilt/app/ECompassCalibration.apk:/system/app/ECompassCalibration.apk


## RIL related stuff
PRODUCT_COPY_FILES += \
    vendor/fih/fm6/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/fih/fm6/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/fih/fm6/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/fih/fm6/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/fih/fm6/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/fih/fm6/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/fih/fm6/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/fih/fm6/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/fih/fm6/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/fih/fm6/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/fih/fm6/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/fih/fm6/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/fih/fm6/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/fih/fm6/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/fih/fm6/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/fih/fm6/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/fih/fm6/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/fih/fm6/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/fih/fm6/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/fih/fm6/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so

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

## Camera proprietaries
PRODUCT_COPY_FILES += \
    vendor/fih/fm6/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/fih/fm6/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/fih/fm6/proprietary/lib/libmmipl.so:system/lib/libmmipl.so

# init scripts
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    device/fih/fm6/prebuilt/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh 
    
    
## GPS
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    device/fih/fm6/prebuilt/etc/loc_parameter.ini:/system/etc/loc_parameter.ini

## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/fih/fm6/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
    vendor/fih/fm6/proprietary/bin/hciattach:system/bin/hciattach \
    device/fih/fm6/prebuilt/bin/btwlancoex:system/bin/btwlancoex \
    device/fih/fm6/prebuilt/bin/port-bridge:system/bin/port-bridge \
    vendor/fih/fm6/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \
    vendor/fih/fm6/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \
    device/fih/fm6/prebuilt/ms3c_charger_offset.cfg:system/etc/ms3c_charger_offset.cfg \
    device/fih/fm6/prebuilt/ms3c_transformation.cfg:system/etc/ms3c_transformation.cfg \
    vendor/fih/fm6/proprietary/bin/updateSensorNV:system/bin/updateSensorNV \
    vendor/fih/fm6/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \
    vendor/fih/fm6/proprietary/lib/hw/sensors.qcom.so:system/lib/hw/sensors.qcom.so \
    vendor/fih/fm6/proprietary/lib/hw/lights.qcom.so:system/lib/hw/lights.qcom.so \
    vendor/fih/fm6/proprietary/bin/gsensorcalibration:system/bin/gsensorcalibration \
    device/fih/fm6/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/fih/fm6/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/fih/fm6/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/fih/fm6/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/fih/fm6/proprietary/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \
    vendor/fih/fm6/proprietary/lib/libaudio.so:system/lib/libaudio.so \
    vendor/fih/fm6/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/fih/fm6/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/fih/fm6/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/fih/fm6/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/fih/fm6/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/fih/fm6/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/fih/fm6/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/fih/fm6/proprietary/lib/libgsl.so:system/lib/libgsl.so

PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/fih/fm6/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/fih/fm6/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/fih/fm6/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/fih/fm6/prebuilt/7x27_kybd.kl:system/usr/keylayout/7x27_kybd.kl \
    device/fih/fm6/prebuilt/keychars/7x27_kybd.kcm.bin:system/usr/keychars/7x27_kybd.kcm.bin \
device/fih/fm6/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
device/fih/fm6/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin 

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/fih/fm6/firmware/calData_ar6102_15dBm.bin:system/wifi/calData_ar6102_15dBm.bin \
    device/fih/fm6/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/fih/fm6/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/fih/fm6/firmware/eeprom.bin:system/wifi/eeprom.bin \
    device/fih/fm6/firmware/eeprom.data:system/wifi/eeprom.data \
    device/fih/fm6/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    vendor/fih/fm6/proprietary/bin/hostapd:system/bin/hostapd 


#Kernel Modules
PRODUCT_COPY_FILES += \
    device/fih/fm6/modules/ar6000.ko:system/wifi/ar6000.ko 

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := fm6
PRODUCT_DEVICE := fm6
PRODUCT_MODEL := Fih fm6
PRODUCT_MANUFACTURER := fih
