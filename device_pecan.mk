$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/pecan/overlay

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
ifeq ($(TARGET_KERNEL_CONFIG),)
TARGET_PREBUILT_KERNEL := device/lge/pecan/kernel
endif # TARGET_KERNEL_CONFIG
endif # TARGET_PREBUILT_KERNEL


PRODUCT_PACKAGES += \
    librs_jni \
    libmm-omxcore \
    libOmxCore \
    gps.pecan \
    copybit.pecan \
    lights.pecan \
    bdaddr_read \
    gadget_id \
    bash

PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    e2fsck \
    SpareParts

DISABLE_DEXPREOPT := false

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/pecan/files/pecan_keypad.kl:system/usr/keylayout/pecan_keypad.kl \
    device/lge/pecan/files/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/pecan/files/pecan_keypad.kcm.bin:system/usr/keychars/pecan_keypad.kcm.bin \

# Board-specific init (does not support charging in "power off" state yet)
PRODUCT_COPY_FILES += \
    device/lge/pecan/files/init.pecan.rc:root/init.pecan.rc \
    device/lge/pecan/files/initlogo.rle:root/initlogo.rle \

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/pecan/proprietary/lib/hw/gralloc.pecan.so:system/lib/hw/gralloc.pecan.so \

# Qualcomm Froyo .sh files
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    vendor/lge/pecan/proprietary/etc/init.goldfish.sh:system/etc/init.goldfish.sh \
    vendor/lge/pecan/proprietary/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    vendor/lge/pecan/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    vendor/lge/pecan/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    vendor/lge/pecan/proprietary/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \


# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/hw/sensors.pecan.so:system/lib/hw/sensors.pecan.so \
    vendor/lge/pecan/proprietary/bin/ami304d:system/bin/ami304d \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/pecan/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/pecan/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/pecan/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/pecan/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/pecan/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/pecan/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/pecan/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/pecan/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# Wifi
PRODUCT_COPY_FILES += \
    device/lge/pecan/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/pecan/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/pecan/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/pecan/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/pecan/proprietary/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/pecan/proprietary/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/pecan/proprietary/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

PRODUCT_COPY_FILES += \
    device/lge/pecan/files/lib/modules/tun.ko:system/lib/modules/tun.ko \
    device/lge/pecan/files/lib/modules/cifs.ko:system/lib/modules/cifs.ko \

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/pecan/files/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    device/lge/pecan/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/pecan/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/pecan/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/lge/pecan/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/qmuxd:system/bin/qmuxd \

# rmt_storage (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/rmt_storage:system/bin/rmt_storage \

# port-bridge (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/port-bridge:system/bin/port-bridge \

# wipeirface (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/wiperiface:system/bin/wiperiface \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/tsdown:system/bin/tsdown \
    vendor/lge/pecan/proprietary/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \

# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/pecan/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/pecan/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \
    debug.sf.hw=1 \
    video.accelerate=1	

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/pecan/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/pecan/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/pecan/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/pecan/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/pecan/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/pecan/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/pecan/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/pecan/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/pecan/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/pecan/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/pecan/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/pecan/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/pecan/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/pecan/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/pecan/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/pecan/proprietary/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/pecan/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/pecan/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/pecan/proprietary/lib/liblgeat.so:system/lib/liblgeat.so \
    vendor/lge/pecan/proprietary/lib/liblgdrm.so:system/lib/liblgdrm.so \
    vendor/lge/pecan/proprietary/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
    vendor/lge/pecan/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/pecan/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/pecan/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/pecan/proprietary/bin/rild:system/bin/rild \

# propietary libril
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/libril.so:system/lib/libril.so \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/pecan/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/pecan/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/pecan/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/pecan/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/pecan/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/pecan/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/pecan/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/pecan/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/pecan/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/pecan/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
#    vendor/lge/pecan/proprietary/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    vendor/lge/pecan/proprietary/lib/libopencore_author.so:system/lib/libopencore_author.so \
#    vendor/lge/pecan/proprietary/lib/libopencore_player.so:system/lib/libopencore_player.so \
#    vendor/lge/pecan/proprietary/lib/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \
#    vendor/lge/pecan/proprietary/lib/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \
#    vendor/lge/pecan/proprietary/lib/libopencorehw.so:system/lib/libopencorehw.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/pecan/proprietary/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd \

PRODUCT_COPY_FILES += \
    device/lge/pecan/files/etc/media_profiles.xml:system/etc/media_profiles.xml

# Lights LG library
PRODUCT_COPY_FILES += \
   vendor/lge/pecan/proprietary/lib/hw/lights.pecan.so:system/lib/hw/lights.pecan.so \

PRODUCT_LOCALES += mdpi

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_pecan
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := pecan
PRODUCT_MODEL := LG-P350
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=pecan
