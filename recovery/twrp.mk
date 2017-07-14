#
# This is for TWRP Recovery
#

TONE_VENDOR := vendor/sony/tone-common/proprietary/vendor

# user interface
TW_THEME := portrait_hdpi
TW_NO_SCREEN_BLANK := true
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 4095
TW_BRIGHTNESS_PATH := "/sys/class/leds/wled/brightness"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# timekeep
TARGET_RECOVERY_QCOM_RTC_FIX := true

# init
TW_EXCLUDE_DEFAULT_USB_INIT := true

# features
TW_USE_TOOLBOX := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true

# storage
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_FUSE_EXFAT := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_NO_SEPARATE_RECOVERY := true

# crypto
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/bootdevice/by-name/userdata"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"

# init
PRODUCT_PACKAGES += \
    twrp.fstab \
    init.recovery.usb

# touch firmwares
PRODUCT_COPY_FILES += \
    $(TONE_VENDOR)/firmware/touch_module_id_0x90.img:recovery/root/vendor/firmware/touch_module_id_0x90.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0x91.img:recovery/root/vendor/firmware/touch_module_id_0x91.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0x92.img:recovery/root/vendor/firmware/touch_module_id_0x92.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0x93.img:recovery/root/vendor/firmware/touch_module_id_0x93.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0x94.img:recovery/root/vendor/firmware/touch_module_id_0x94.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0xb0.img:recovery/root/vendor/firmware/touch_module_id_0xb0.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0xb1.img:recovery/root/vendor/firmware/touch_module_id_0xb1.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0xb2.img:recovery/root/vendor/firmware/touch_module_id_0xb2.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0xba.img:recovery/root/vendor/firmware/touch_module_id_0xba.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0xbb.img:recovery/root/vendor/firmware/touch_module_id_0xbb.img \
    $(TONE_VENDOR)/firmware/touch_module_id_0xbc.img:recovery/root/vendor/firmware/touch_module_id_0xbc.img
