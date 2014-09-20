# Copyright (C) 2012 The Android Open Source Project
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

$(call inherit-product, build/target/product/full.mk)

#PRODUCT_PACKAGES += gralloc.enclustra
#PRODUCT_PACKAGES += drm_lights.antmicro
#PRODUCT_PACKAGES += hwcomposer.antmicro
#PRODUCT_PACKAGES += v4l2_camera.antmicro
# hwcomposer.zynq
PRODUCT_PACKAGES += busybox

PRODUCT_NAME := mars_zx3
TARGET_BOOTLOADER_BOARD_NAME := zynq
TARGET_BOARD_PLATFORM := zynq

# no kernel, no bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

BOARD_WPA_SUPPLICANT_DRIVER := WEXT

PRODUCT_DEVICE := mars_zx3
PRODUCT_BRAND := Android
PRODUCT_MODEL := Enclustra Mars ZX3

# set density to 120 (ldpi) - needed for "tablet" mode
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

# set number of gralloc framebuffers to 2
PRODUCT_PROPERTY_OVERRIDES += \
    debug.gr.numframebuffers=2

# no gpu to cpu
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1

# set sleep mode to 3 --> "wait for interrupt and ramp clock"
PRODUCT_PROPERTY_OVERRIDES += \
    pm.sleep_mode=3

# set heap size to 32 megs
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

# turn off power collapse
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.disable.power.collapse=0

# wifi-only device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=1

# run shell
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1

# wifi interface name
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

DEVICE_PACKAGE_OVERLAYS := \
    device/generic/armv7-a-neon/overlay \
    device/enclustra/mars_zx3/overlay


# tablet, no sd card
PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_COPY_FILES := \
    device/enclustra/mars_zx3/files/init.usb.rc:root/init.usb.rc \
    device/enclustra/mars_zx3/files/fstab.usb:root/fstab.usb \
    device/enclustra/mars_zx3/files/vold.fstab:system/etc/vold.fstab \
    device/enclustra/mars_zx3/files/hide_cursor.sh:root/hide_cursor.sh \
    device/enclustra/mars_zx3/files/slowdown.sh:root/slowdown.sh \
    device/enclustra/mars_zx3/files/init:root/sbin/init \
    device/enclustra/mars_zx3/files/uinput:root/sbin/uinput \
    device/enclustra/mars_zx3/files/EP0700M06.idc:system/usr/idc/EP0700M06.idc \
    device/enclustra/mars_zx3/files/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/enclustra/mars_zx3/files/htc_9271.fw:system/etc/firmware/htc_9271.fw \
    frameworks/base/data/fonts/fallback_fonts.xml:system/etc/fallback_fonts.xml \
    frameworks/base/data/fonts/fallback_fonts.xml:system/etc/fallback_fonts.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/fonts/system_fonts.xml:system/etc/system_fonts.xml

