# Fingerprint extension feature
ifneq (,$(filter aosp% factory%, $(TARGET_PRODUCT)))
# Skip if device is AOSP or factory build
else
    ifneq (,$(filter userdebug, $(TARGET_BUILD_VARIANT)))
    $(call soong_config_set,fp_hal_feature,report_bug_support,true)
    BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/fingerprint-extension/vendor/
    SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/fingerprint-extension/system_ext/public/
    SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/fingerprint-extension/system_ext/private/
    PRODUCT_PACKAGES += \
        fps_ext_bug_lib \
        fingerprint.extension.sh
    endif
endif
