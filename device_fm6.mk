# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/fih/fm6/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
                copybit.fm6 \
                gralloc.fm6 \
                gps.fm6 \
                abtfilt \
                lights.msm7k\
                hwprops \
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
    vendor/fih/fm6/proprietary/lib/libaudiopolicy.so:system/lib/audiopolicy.so \
    vendor/fih/fm6/proprietary/lib/libaudio.so:system/lib/libaudio.so \
    vendor/fih/fm6/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/fih/fm6/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/fih/fm6/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so

## OMX proprietaries
PRODUCT_COPY_FILES += \
    vendor/fih/fm6/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/fih/fm6/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/fih/fm6/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/fih/fm6/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/fih/fm6/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/fih/fm6/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/fih/fm6/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/fih/fm6/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/fih/fm6/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/fih/fm6/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/fih/fm6/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

## Camera proprietaries
PRODUCT_COPY_FILES += \
    vendor/fih/fm6/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/fih/fm6/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/fih/fm6/proprietary/lib/libmmipl.so:system/lib/libmmipl.so

## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/fih/fm6/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
    vendor/fih/fm6/proprietary/bin/hciattach:system/bin/hciattach \
    device/fih/fm6/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    vendor/fih/fm6/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \
    vendor/fih/fm6/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \
    device/fih/fm6/prebuilt/SensorCalibration.apk:system/app/SensorCalibration.apk \
    device/fih/fm6/prebuilt/ms3c_charger_offset.cfg:system/etc/ms3c_charger_offset.cfg \
    device/fih/fm6/prebuilt/ms3c_transformation.cfg:system/etc/ms3c_transformation.cfg \
    vendor/fih/fm6/proprietary/bin/updateSensorNV:system/bin/updateSensorNV \
    vendor/fih/fm6/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \
    vendor/fih/fm6/proprietary/lib/hw/sensors.qcom.so:system/lib/hw/sensors.qcom.so \
    vendor/fih/fm6/proprietary/bin/gsensorcalibration:system/bin/gsensorcalibration \
    device/fih/fm6/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/fih/fm6/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/fih/fm6/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/fih/fm6/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
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
    device/fih/fm6/prebuilt/PANJIT_Touchscreen.kcm.bin:system/usr/keychars/PANJIT_Touchscreen.kcm.bin

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/fih/fm6/firmware/calData_ar6102_15dBm.bin:system/wifi/calData_ar6102_15dBm.bin \
    device/fih/fm6/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/fih/fm6/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/fih/fm6/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin  \
    device/fih/fm6/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    device/fih/fm6/firmware/wlan/qcom_nv.bin:system/etc/firmware/wlan/qcom_nv.bin \
    device/fih/fm6/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    device/fih/fm6/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini 
   
#Kernel Modules
PRODUCT_COPY_FILES += \
    device/fih/fm6/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/fih/fm6/prebuilt/ar6000-ap.ko:system/wifi/ar6000-ap.ko \
    device/fih/fm6/prebuilt/ar6000_tcmd.ko:system/wifi/ar6000_tcmd.ko 



$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := fm6
PRODUCT_DEVICE := fm6
PRODUCT_MODEL := Fih fm6
PRODUCT_MANUFACTURER := fih
