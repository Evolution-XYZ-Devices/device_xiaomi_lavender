#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=lavender
export DEVICE_COMMON=sdm660-common
export VENDOR=xiaomi

function blob_fixup() {
    case "${1}" in
        vendor/lib/lib_lowlight.so)
            "${PATCHELF}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;
        vendor/lib64/libvendor.goodix.hardware.interfaces.biometrics.fingerprint@2.1.so)
            "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
	        ;;
    esac
}

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
