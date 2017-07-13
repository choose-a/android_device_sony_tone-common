#
# This is for TWRP Recovery
#

# UI
TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 255
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# init
TW_EXCLUDE_DEFAULT_USB_INIT := true

# features
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true

# copying files
PRODUCT_COPY_FILES += \
    device/sony/tone-common/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

